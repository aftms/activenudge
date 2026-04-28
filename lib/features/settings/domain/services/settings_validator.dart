import '../entities/app_settings.dart';

enum SettingsValidationError {
  intervalMustBePositive,
  durationMustBePositive,
  invalidActiveHours,
  activeDaysRequired,
}

class SettingsValidator {
  const SettingsValidator();

  List<SettingsValidationError> validate(AppSettings settings) {
    final errors = <SettingsValidationError>[];
    if (settings.reminderIntervalMinutes <= 0) {
      errors.add(SettingsValidationError.intervalMustBePositive);
    }
    if (settings.defaultActivityDurationMinutes <= 0) {
      errors.add(SettingsValidationError.durationMustBePositive);
    }
    if (!settings.activeStartTime.isValid ||
        !settings.activeEndTime.isValid ||
        settings.activeStartTime.minutesFromMidnight >=
            settings.activeEndTime.minutesFromMidnight) {
      errors.add(SettingsValidationError.invalidActiveHours);
    }
    if (settings.remindersEnabled && settings.activeWeekdays.isEmpty) {
      errors.add(SettingsValidationError.activeDaysRequired);
    }
    return errors;
  }
}
