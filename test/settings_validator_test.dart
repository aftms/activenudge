import 'package:activenudge/features/settings/domain/entities/app_settings.dart';
import 'package:activenudge/features/settings/domain/entities/app_time_of_day.dart';
import 'package:activenudge/features/settings/domain/services/settings_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('accepts valid default settings', () {
    final errors = const SettingsValidator().validate(AppSettings.defaults());

    expect(errors, isEmpty);
  });

  test('rejects invalid interval, duration, hours, and active days', () {
    final settings = AppSettings.defaults().copyWith(
      reminderIntervalMinutes: 0,
      defaultActivityDurationMinutes: 0,
      activeStartTime: const AppTimeOfDay(hour: 18, minute: 0),
      activeEndTime: const AppTimeOfDay(hour: 9, minute: 0),
      activeWeekdays: const <int>[],
      remindersEnabled: true,
    );

    final errors = const SettingsValidator().validate(settings);

    expect(
      errors,
      containsAll(<SettingsValidationError>[
        SettingsValidationError.intervalMustBePositive,
        SettingsValidationError.durationMustBePositive,
        SettingsValidationError.invalidActiveHours,
        SettingsValidationError.activeDaysRequired,
      ]),
    );
  });
}
