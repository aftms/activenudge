import '../../activities/domain/entities/activity.dart';
import '../domain/entities/activity_session_status.dart';

class ActivitySessionState {
  const ActivitySessionState({
    required this.activity,
    required this.status,
    required this.remainingSeconds,
    required this.plannedDurationMinutes,
    this.startedAt,
    this.endedAt,
  });

  factory ActivitySessionState.initial(Activity activity) {
    return ActivitySessionState(
      activity: activity,
      status: ActivitySessionStatus.idle,
      remainingSeconds: activity.suggestedDurationMinutes * 60,
      plannedDurationMinutes: activity.suggestedDurationMinutes,
    );
  }

  final Activity activity;
  final ActivitySessionStatus status;
  final int remainingSeconds;
  final int plannedDurationMinutes;
  final DateTime? startedAt;
  final DateTime? endedAt;

  bool get isFinished =>
      status == ActivitySessionStatus.completed ||
      status == ActivitySessionStatus.skipped ||
      status == ActivitySessionStatus.expired;

  ActivitySessionState copyWith({
    Activity? activity,
    ActivitySessionStatus? status,
    int? remainingSeconds,
    int? plannedDurationMinutes,
    DateTime? startedAt,
    DateTime? endedAt,
  }) {
    return ActivitySessionState(
      activity: activity ?? this.activity,
      status: status ?? this.status,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      plannedDurationMinutes:
          plannedDurationMinutes ?? this.plannedDurationMinutes,
      startedAt: startedAt ?? this.startedAt,
      endedAt: endedAt ?? this.endedAt,
    );
  }
}
