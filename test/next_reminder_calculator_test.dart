import 'package:activenudge/features/reminders/domain/services/next_reminder_calculator.dart';
import 'package:activenudge/features/settings/domain/entities/app_settings.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('calculates next reminder inside active hours', () {
    final settings = AppSettings.defaults().copyWith(remindersEnabled: true);
    final next = const NextReminderCalculator().calculateNext(
      from: DateTime(2026, 4, 27, 10),
      settings: settings,
    );

    expect(next, DateTime(2026, 4, 27, 11));
  });

  test('moves next reminder to next active day when outside active hours', () {
    final settings = AppSettings.defaults().copyWith(remindersEnabled: true);
    final next = const NextReminderCalculator().calculateNext(
      from: DateTime(2026, 4, 27, 18, 30),
      settings: settings,
    );

    expect(next, DateTime(2026, 4, 28, 9));
  });

  test('returns null when reminders are disabled', () {
    final next = const NextReminderCalculator().calculateNext(
      from: DateTime(2026, 4, 27, 10),
      settings: AppSettings.defaults(),
    );

    expect(next, isNull);
  });
}
