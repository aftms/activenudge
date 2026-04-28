import 'package:activenudge/core/time/date_time_provider.dart';
import 'package:activenudge/features/activities/application/activity_seed_service.dart';
import 'package:activenudge/features/activities/domain/entities/activity.dart';
import 'package:activenudge/features/activities/domain/repositories/activity_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('seeds initial activities once without duplication', () async {
    final repository = _FakeActivityRepository();
    final service = ActivitySeedService(
      activityRepository: repository,
      dateTimeProvider: _FixedDateTimeProvider(DateTime(2026, 4, 28)),
    );

    await service.seedDefaultsIfNeeded();
    await service.seedDefaultsIfNeeded();

    expect(repository.activities, hasLength(8));
    expect(repository.upsertCalls, 1);
  });
}

class _FakeActivityRepository implements ActivityRepository {
  final activities = <Activity>[];
  int upsertCalls = 0;

  @override
  Future<int> countActivities() async => activities.length;

  @override
  Future<List<Activity>> getActiveActivities() async => activities;

  @override
  Future<Activity?> getByStableId(String stableId) async {
    return activities
        .where((activity) => activity.stableId == stableId)
        .firstOrNull;
  }

  @override
  Future<void> upsertMany(List<Activity> activities) async {
    upsertCalls++;
    this.activities.addAll(activities);
  }

  @override
  Stream<List<Activity>> watchActiveActivities() {
    return Stream<List<Activity>>.value(activities);
  }
}

class _FixedDateTimeProvider implements DateTimeProvider {
  _FixedDateTimeProvider(this.value);

  final DateTime value;

  @override
  DateTime now() => value;
}
