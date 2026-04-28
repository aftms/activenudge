import '../entities/activity.dart';

abstract interface class ActivityRepository {
  Future<List<Activity>> getActiveActivities();
  Stream<List<Activity>> watchActiveActivities();
  Future<Activity?> getByStableId(String stableId);
  Future<int> countActivities();
  Future<void> upsertMany(List<Activity> activities);
}
