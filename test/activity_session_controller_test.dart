import 'package:activenudge/core/time/date_time_provider.dart';
import 'package:activenudge/features/activities/application/activity_seed_service.dart';
import 'package:activenudge/features/activity_session/application/activity_session_controller.dart';
import 'package:activenudge/features/activity_session/domain/entities/activity_session_status.dart';
import 'package:activenudge/features/history/domain/entities/history_entry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('moves through start, pause, resume, and complete states', () async {
    final history = <HistoryEntry>[];
    final activity = ActivitySeedService.defaultActivities(
      DateTime(2026, 4, 28),
    ).first;
    final controller = ActivitySessionController(
      activity: activity,
      dateTimeProvider: _FixedDateTimeProvider(DateTime(2026, 4, 28, 10)),
      saveHistory: (entry) async => history.add(entry),
      onHistoryChanged: () {},
    );

    controller.start();
    expect(controller.state.status, ActivitySessionStatus.running);

    controller.pause();
    expect(controller.state.status, ActivitySessionStatus.paused);

    controller.resume();
    expect(controller.state.status, ActivitySessionStatus.running);

    await controller.complete();
    expect(controller.state.status, ActivitySessionStatus.completed);
    expect(history, hasLength(1));
    expect(history.single.result, SessionResult.completed);

    controller.dispose();
  });
}

class _FixedDateTimeProvider implements DateTimeProvider {
  _FixedDateTimeProvider(this.value);

  final DateTime value;

  @override
  DateTime now() => value;
}
