import 'package:isar_community/isar.dart';

import '../../domain/entities/app_language.dart';
import '../../domain/entities/app_settings.dart';
import '../../domain/entities/app_time_of_day.dart';

part 'settings_model.g.dart';

@collection
class SettingsModel {
  Id id = 1;

  @enumerated
  late AppLanguage language;

  late int reminderIntervalMinutes;
  late int defaultActivityDurationMinutes;
  late int activeStartHour;
  late int activeStartMinute;
  late int activeEndHour;
  late int activeEndMinute;
  late List<int> activeWeekdays;
  late bool remindersEnabled;
  late bool notificationsEnabled;
  late bool soundEnabled;
  late bool vibrationEnabled;
  late bool autoOpenExternalContent;
  late DateTime updatedAt;

  AppSettings toEntity() {
    return AppSettings(
      language: language,
      reminderIntervalMinutes: reminderIntervalMinutes,
      defaultActivityDurationMinutes: defaultActivityDurationMinutes,
      activeStartTime: AppTimeOfDay(
        hour: activeStartHour,
        minute: activeStartMinute,
      ),
      activeEndTime: AppTimeOfDay(hour: activeEndHour, minute: activeEndMinute),
      activeWeekdays: activeWeekdays,
      remindersEnabled: remindersEnabled,
      notificationsEnabled: notificationsEnabled,
      soundEnabled: soundEnabled,
      vibrationEnabled: vibrationEnabled,
      autoOpenExternalContent: autoOpenExternalContent,
    );
  }

  static SettingsModel fromEntity(AppSettings settings, DateTime updatedAt) {
    return SettingsModel()
      ..id = 1
      ..language = settings.language
      ..reminderIntervalMinutes = settings.reminderIntervalMinutes
      ..defaultActivityDurationMinutes = settings.defaultActivityDurationMinutes
      ..activeStartHour = settings.activeStartTime.hour
      ..activeStartMinute = settings.activeStartTime.minute
      ..activeEndHour = settings.activeEndTime.hour
      ..activeEndMinute = settings.activeEndTime.minute
      ..activeWeekdays = settings.activeWeekdays
      ..remindersEnabled = settings.remindersEnabled
      ..notificationsEnabled = settings.notificationsEnabled
      ..soundEnabled = settings.soundEnabled
      ..vibrationEnabled = settings.vibrationEnabled
      ..autoOpenExternalContent = settings.autoOpenExternalContent
      ..updatedAt = updatedAt;
  }
}
