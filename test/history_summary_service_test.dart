import 'package:activenudge/features/history/application/history_summary_service.dart';
import 'package:activenudge/features/history/domain/entities/history_entry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('summarizes completed sessions and active minutes for today', () {
    final now = DateTime(2026, 4, 28, 12);
    final summary = const HistorySummaryService().summarizeToday(
      now: now,
      entries: <HistoryEntry>[
        _entry(
          startedAt: DateTime(2026, 4, 28, 9),
          result: SessionResult.completed,
          seconds: 300,
        ),
        _entry(
          startedAt: DateTime(2026, 4, 28, 10),
          result: SessionResult.skipped,
          seconds: 30,
        ),
        _entry(
          startedAt: DateTime(2026, 4, 27, 10),
          result: SessionResult.completed,
          seconds: 600,
        ),
      ],
    );

    expect(summary.completedToday, 1);
    expect(summary.activeMinutesToday, 5);
    expect(summary.completionRate, 0.5);
  });
}

HistoryEntry _entry({
  required DateTime startedAt,
  required SessionResult result,
  required int seconds,
}) {
  return HistoryEntry(
    entryId: startedAt.microsecondsSinceEpoch.toString(),
    activityStableId: 'neck_stretch',
    activityTitleEn: 'Neck stretch',
    activityTitlePt: 'Alongamento cervical',
    startedAt: startedAt,
    endedAt: startedAt.add(Duration(seconds: seconds)),
    plannedDurationMinutes: 5,
    effectiveDurationSeconds: seconds,
    result: result,
    origin: SessionOrigin.manual,
  );
}
