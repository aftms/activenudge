import 'package:activenudge/features/activities/application/activity_seed_service.dart';
import 'package:activenudge/features/activities/domain/services/activity_suggestion_service.dart';
import 'package:activenudge/features/history/domain/entities/history_entry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'chooses an active activity and avoids recent activity when possible',
    () {
      final activities = ActivitySeedService.defaultActivities(
        DateTime(2026, 4, 28),
      );
      final suggestion = const ActivitySuggestionService()
          .chooseSuggestedActivity(
            activities: activities,
            now: DateTime(2026, 4, 28, 10),
            recentHistory: <HistoryEntry>[
              _history('back_stretch'),
              _history('breathing_and_posture'),
              _history('light_squats'),
            ],
          );

      expect(suggestion, isNotNull);
      expect(<String>{
        'back_stretch',
        'breathing_and_posture',
        'light_squats',
      }, isNot(contains(suggestion!.stableId)));
    },
  );
}

HistoryEntry _history(String activityId) {
  return HistoryEntry(
    entryId: activityId,
    activityStableId: activityId,
    activityTitleByLanguage: <String, String>{
      'en': activityId,
      'pt': activityId,
    },
    startedAt: DateTime(2026, 4, 28),
    plannedDurationMinutes: 5,
    effectiveDurationSeconds: 60,
    result: SessionResult.completed,
    origin: SessionOrigin.manual,
  );
}
