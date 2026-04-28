import 'package:activenudge/features/activities/domain/entities/activity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('returns requested translation and falls back to English', () {
    final activity = Activity(
      stableId: 'custom',
      translations: const <String, ActivityTranslation>{
        'en': ActivityTranslation(
          languageCode: 'en',
          title: 'Move',
          description: 'Short break',
          instructions: 'Stand up',
        ),
        'pt': ActivityTranslation(
          languageCode: 'pt',
          title: 'Mexer',
          description: 'Pausa curta',
          instructions: 'Levante-se',
        ),
      },
      suggestedDurationMinutes: 5,
      category: ActivityCategory.mobility,
      intensity: ActivityIntensity.low,
      contentType: ActivityContentType.text,
      isActive: true,
      createdAt: DateTime(2026, 4, 28),
      updatedAt: DateTime(2026, 4, 28),
    );

    expect(activity.titleForLanguageCode('pt'), 'Mexer');
    expect(activity.titleForLanguageCode('es'), 'Move');
  });
}
