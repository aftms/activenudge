import 'app_language.dart';
import 'app_time_of_day.dart';

class AppSettings {
  const AppSettings({
    required this.language,
    required this.reminderIntervalMinutes,
    required this.defaultActivityDurationMinutes,
    required this.activeStartTime,
    required this.activeEndTime,
    required this.activeWeekdays,
    required this.remindersEnabled,
    required this.notificationsEnabled,
    required this.soundEnabled,
    required this.vibrationEnabled,
    required this.autoOpenExternalContent,
  });

  factory AppSettings.defaults() {
    return const AppSettings(
      language: AppLanguage.system,
      reminderIntervalMinutes: 60,
      defaultActivityDurationMinutes: 5,
      activeStartTime: AppTimeOfDay(hour: 9, minute: 0),
      activeEndTime: AppTimeOfDay(hour: 18, minute: 0),
      activeWeekdays: <int>[
        DateTime.monday,
        DateTime.tuesday,
        DateTime.wednesday,
        DateTime.thursday,
        DateTime.friday,
      ],
      remindersEnabled: false,
      notificationsEnabled: true,
      soundEnabled: true,
      vibrationEnabled: true,
      autoOpenExternalContent: false,
    );
  }

  final AppLanguage language;
  final int reminderIntervalMinutes;
  final int defaultActivityDurationMinutes;
  final AppTimeOfDay activeStartTime;
  final AppTimeOfDay activeEndTime;
  final List<int> activeWeekdays;
  final bool remindersEnabled;
  final bool notificationsEnabled;
  final bool soundEnabled;
  final bool vibrationEnabled;
  final bool autoOpenExternalContent;

  AppSettings copyWith({
    AppLanguage? language,
    int? reminderIntervalMinutes,
    int? defaultActivityDurationMinutes,
    AppTimeOfDay? activeStartTime,
    AppTimeOfDay? activeEndTime,
    List<int>? activeWeekdays,
    bool? remindersEnabled,
    bool? notificationsEnabled,
    bool? soundEnabled,
    bool? vibrationEnabled,
    bool? autoOpenExternalContent,
  }) {
    return AppSettings(
      language: language ?? this.language,
      reminderIntervalMinutes:
          reminderIntervalMinutes ?? this.reminderIntervalMinutes,
      defaultActivityDurationMinutes:
          defaultActivityDurationMinutes ?? this.defaultActivityDurationMinutes,
      activeStartTime: activeStartTime ?? this.activeStartTime,
      activeEndTime: activeEndTime ?? this.activeEndTime,
      activeWeekdays: activeWeekdays ?? this.activeWeekdays,
      remindersEnabled: remindersEnabled ?? this.remindersEnabled,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      soundEnabled: soundEnabled ?? this.soundEnabled,
      vibrationEnabled: vibrationEnabled ?? this.vibrationEnabled,
      autoOpenExternalContent:
          autoOpenExternalContent ?? this.autoOpenExternalContent,
    );
  }
}
