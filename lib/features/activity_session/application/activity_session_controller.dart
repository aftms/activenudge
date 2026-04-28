import 'dart:async';

import 'package:flutter_riverpod/legacy.dart';

import '../../../app/providers.dart';
import '../../../core/time/date_time_provider.dart';
import '../../activities/domain/entities/activity.dart';
import '../../history/domain/entities/history_entry.dart';
import '../domain/entities/activity_session_status.dart';
import 'activity_session_state.dart';

class ActivitySessionController extends StateNotifier<ActivitySessionState> {
  ActivitySessionController({
    required Activity activity,
    required DateTimeProvider dateTimeProvider,
    required Future<void> Function(HistoryEntry entry) saveHistory,
    required void Function() onHistoryChanged,
  }) : _dateTimeProvider = dateTimeProvider,
       _saveHistory = saveHistory,
       _onHistoryChanged = onHistoryChanged,
       super(ActivitySessionState.initial(activity));

  final DateTimeProvider _dateTimeProvider;
  final Future<void> Function(HistoryEntry entry) _saveHistory;
  final void Function() _onHistoryChanged;
  Timer? _timer;

  void start({SessionOrigin origin = SessionOrigin.manual}) {
    if (state.status != ActivitySessionStatus.idle) {
      return;
    }
    state = state.copyWith(
      status: ActivitySessionStatus.running,
      startedAt: _dateTimeProvider.now(),
    );
    _startTimer();
  }

  void pause() {
    if (state.status != ActivitySessionStatus.running) {
      return;
    }
    _timer?.cancel();
    state = state.copyWith(status: ActivitySessionStatus.paused);
  }

  void resume() {
    if (state.status != ActivitySessionStatus.paused) {
      return;
    }
    state = state.copyWith(status: ActivitySessionStatus.running);
    _startTimer();
  }

  Future<void> complete() => _finish(SessionResult.completed);
  Future<void> skip() => _finish(SessionResult.skipped);

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final nextRemaining = state.remainingSeconds - 1;
      if (nextRemaining <= 0) {
        state = state.copyWith(remainingSeconds: 0);
        unawaited(_finish(SessionResult.expired));
        return;
      }
      state = state.copyWith(remainingSeconds: nextRemaining);
    });
  }

  Future<void> _finish(SessionResult result) async {
    if (state.isFinished) {
      return;
    }
    _timer?.cancel();
    final now = _dateTimeProvider.now();
    final startedAt = state.startedAt ?? now;
    final status = switch (result) {
      SessionResult.completed => ActivitySessionStatus.completed,
      SessionResult.skipped => ActivitySessionStatus.skipped,
      SessionResult.expired => ActivitySessionStatus.expired,
    };
    final effectiveSeconds =
        (state.plannedDurationMinutes * 60) - state.remainingSeconds;
    state = state.copyWith(status: status, endedAt: now);
    await _saveHistory(
      HistoryEntry(
        entryId:
            '${state.activity.stableId}-${startedAt.microsecondsSinceEpoch}',
        activityStableId: state.activity.stableId,
        activityTitleEn: state.activity.titleEn,
        activityTitlePt: state.activity.titlePt,
        startedAt: startedAt,
        endedAt: now,
        plannedDurationMinutes: state.plannedDurationMinutes,
        effectiveDurationSeconds: effectiveSeconds < 0 ? 0 : effectiveSeconds,
        result: result,
        origin: SessionOrigin.manual,
      ),
    );
    _onHistoryChanged();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final activitySessionControllerProvider = StateNotifierProvider.autoDispose
    .family<ActivitySessionController, ActivitySessionState, Activity>((
      ref,
      activity,
    ) {
      return ActivitySessionController(
        activity: activity,
        dateTimeProvider: ref.read(dateTimeProviderProvider),
        saveHistory: (entry) async {
          final repository = await ref.read(historyRepositoryProvider.future);
          await repository.add(entry);
        },
        onHistoryChanged: () {
          ref.invalidate(recentHistoryProvider);
          ref.invalidate(historySummaryProvider);
        },
      );
    });
