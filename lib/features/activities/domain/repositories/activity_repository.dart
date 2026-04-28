import '../entities/activity.dart';

abstract interface class ActivityRepository {
  Future<List<Activity>> getAllActivities();
  Future<List<Activity>> getActiveActivities();
  Stream<List<Activity>> watchAllActivities();
  Stream<List<Activity>> watchActiveActivities();
  Future<Activity?> getByStableId(String stableId);
  Future<int> countActivities();
  Future<void> upsert(Activity activity);
  Future<void> upsertMany(List<Activity> activities);
}
