import 'dart:ui';

import '../../../app/localization/generated/app_localizations.dart';
import '../../../core/time/date_time_provider.dart';
import '../../activities/domain/repositories/activity_repository.dart';
import '../../activities/domain/services/activity_suggestion_service.dart';
import '../../settings/domain/entities/app_language.dart';
import '../../settings/domain/entities/app_settings.dart';
import '../domain/entities/scheduled_reminder.dart';
import '../domain/services/next_reminder_calculator.dart';
import '../infrastructure/notification_service.dart';

abstract interface class ReminderScheduler {
  Future<DateTime?> scheduleNext(AppSettings settings);
  Future<void> cancelAll();
}

class LocalReminderScheduler implements ReminderScheduler {
  LocalReminderScheduler({
    required NotificationService notificationService,
    required ActivityRepository activityRepository,
    required DateTimeProvider dateTimeProvider,
    required NextReminderCalculator calculator,
    required ActivitySuggestionService suggestionService,
  }) : _notificationService = notificationService,
       _activityRepository = activityRepository,
       _dateTimeProvider = dateTimeProvider,
       _calculator = calculator,
       _suggestionService = suggestionService;

  static const int reminderNotificationId = 1001;

  final NotificationService _notificationService;
  final ActivityRepository _activityRepository;
  final DateTimeProvider _dateTimeProvider;
  final NextReminderCalculator _calculator;
  final ActivitySuggestionService _suggestionService;

  @override
  Future<void> cancelAll() => _notificationService.cancelAll();

  @override
  Future<DateTime?> scheduleNext(AppSettings settings) async {
    await _notificationService.cancelAll();
    final next = _calculator.calculateNext(
      from: _dateTimeProvider.now(),
      settings: settings,
    );
    if (next == null) {
      return null;
    }

    final activities = await _activityRepository.getActiveActivities();
    final activity = _suggestionService.chooseSuggestedActivity(
      activities: activities,
      now: next,
    );
    if (activity == null) {
      return null;
    }

    final locale = switch (settings.language) {
      AppLanguage.portuguese => const Locale('pt'),
      AppLanguage.english => const Locale('en'),
      AppLanguage.system =>
        PlatformDispatcher.instance.locale.languageCode == 'pt'
            ? const Locale('pt')
            : const Locale('en'),
    };
    final copy = lookupAppLocalizations(locale);
    final title = copy.timeToMoveTitle;
    final activityTitle = activity.titleForLanguageCode(locale.languageCode);
    final message = copy.timeToMoveMessage(
      activityTitle,
      activity.suggestedDurationMinutes,
    );

    await _notificationService.scheduleReminder(
      reminder: ScheduledReminder(
        id: reminderNotificationId,
        activityStableId: activity.stableId,
        scheduledAt: next,
      ),
      title: title,
      message: message,
      channelName: copy.movementRemindersChannelName,
      channelDescription: copy.movementRemindersChannelDescription,
      playSound: settings.soundEnabled,
      enableVibration: settings.vibrationEnabled,
    );
    return next;
  }
}
