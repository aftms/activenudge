enum SessionResult { completed, skipped, expired }

enum SessionOrigin { reminder, manual }

class HistoryEntry {
  const HistoryEntry({
    required this.entryId,
    required this.activityStableId,
    required this.activityTitleEn,
    required this.activityTitlePt,
    required this.startedAt,
    required this.plannedDurationMinutes,
    required this.effectiveDurationSeconds,
    required this.result,
    required this.origin,
    this.endedAt,
  });

  final String entryId;
  final String activityStableId;
  final String activityTitleEn;
  final String activityTitlePt;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int plannedDurationMinutes;
  final int effectiveDurationSeconds;
  final SessionResult result;
  final SessionOrigin origin;
}
