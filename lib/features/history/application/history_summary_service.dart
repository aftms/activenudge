import '../domain/entities/history_entry.dart';
import '../domain/entities/history_summary.dart';

class HistorySummaryService {
  const HistorySummaryService();

  HistorySummary summarizeToday({
    required List<HistoryEntry> entries,
    required DateTime now,
  }) {
    final today = entries.where((entry) {
      return entry.startedAt.year == now.year &&
          entry.startedAt.month == now.month &&
          entry.startedAt.day == now.day;
    }).toList();

    final completed = today
        .where((entry) => entry.result == SessionResult.completed)
        .toList();
    final totalFinished = today
        .where(
          (entry) =>
              entry.result == SessionResult.completed ||
              entry.result == SessionResult.skipped ||
              entry.result == SessionResult.expired,
        )
        .length;
    final activeSeconds = completed.fold<int>(
      0,
      (sum, entry) => sum + entry.effectiveDurationSeconds,
    );

    return HistorySummary(
      completedToday: completed.length,
      activeMinutesToday: (activeSeconds / 60).round(),
      completionRate: totalFinished == 0 ? 0 : completed.length / totalFinished,
    );
  }
}
