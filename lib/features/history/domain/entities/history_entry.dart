enum SessionResult { completed, skipped, expired }

enum SessionOrigin { reminder, manual }

class HistoryEntry {
  const HistoryEntry({
    required this.entryId,
    required this.activityStableId,
    required this.activityTitleByLanguage,
    required this.startedAt,
    required this.plannedDurationMinutes,
    required this.effectiveDurationSeconds,
    required this.result,
    required this.origin,
    this.endedAt,
  });

  final String entryId;
  final String activityStableId;
  final Map<String, String> activityTitleByLanguage;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int plannedDurationMinutes;
  final int effectiveDurationSeconds;
  final SessionResult result;
  final SessionOrigin origin;

  String activityTitleForLanguageCode(String languageCode) {
    return activityTitleByLanguage[languageCode] ??
        activityTitleByLanguage['en'] ??
        (activityTitleByLanguage.isEmpty
            ? activityStableId
            : activityTitleByLanguage.values.first);
  }
}
