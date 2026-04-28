import '../../../history/domain/entities/history_entry.dart';
import '../entities/activity.dart';

class ActivitySuggestionService {
  const ActivitySuggestionService();

  Activity? chooseSuggestedActivity({
    required List<Activity> activities,
    required DateTime now,
    List<HistoryEntry> recentHistory = const <HistoryEntry>[],
  }) {
    final active = activities.where((activity) => activity.isActive).toList()
      ..sort((a, b) => a.stableId.compareTo(b.stableId));
    if (active.isEmpty) {
      return null;
    }

    final recentIds = recentHistory
        .take(3)
        .map((entry) => entry.activityStableId)
        .toSet();
    final notRecentlyUsed = active
        .where((activity) => !recentIds.contains(activity.stableId))
        .toList();
    final pool = notRecentlyUsed.isEmpty ? active : notRecentlyUsed;
    return pool[now.millisecondsSinceEpoch % pool.length];
  }
}
