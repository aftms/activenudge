import '../../../settings/domain/entities/app_settings.dart';

class NextReminderCalculator {
  const NextReminderCalculator();

  DateTime? calculateNext({
    required DateTime from,
    required AppSettings settings,
  }) {
    if (!settings.remindersEnabled ||
        !settings.notificationsEnabled ||
        settings.reminderIntervalMinutes <= 0 ||
        settings.activeWeekdays.isEmpty) {
      return null;
    }

    final startMinute = settings.activeStartTime.minutesFromMidnight;
    final endMinute = settings.activeEndTime.minutesFromMidnight;
    if (startMinute >= endMinute) {
      return null;
    }

    var candidate = from.add(
      Duration(minutes: settings.reminderIntervalMinutes),
    );
    for (var attempts = 0; attempts < 14; attempts++) {
      final day = DateTime(candidate.year, candidate.month, candidate.day);
      if (!settings.activeWeekdays.contains(day.weekday)) {
        candidate = DateTime(
          day.year,
          day.month,
          day.day + 1,
          settings.activeStartTime.hour,
          settings.activeStartTime.minute,
        );
        continue;
      }

      final start = DateTime(
        day.year,
        day.month,
        day.day,
        settings.activeStartTime.hour,
        settings.activeStartTime.minute,
      );
      final end = DateTime(
        day.year,
        day.month,
        day.day,
        settings.activeEndTime.hour,
        settings.activeEndTime.minute,
      );

      if (candidate.isBefore(start)) {
        return start;
      }
      if (candidate.isBefore(end) || candidate.isAtSameMomentAs(end)) {
        return candidate;
      }
      candidate = DateTime(
        day.year,
        day.month,
        day.day + 1,
        settings.activeStartTime.hour,
        settings.activeStartTime.minute,
      );
    }
    return null;
  }
}
