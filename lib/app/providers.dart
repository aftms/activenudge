import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';

import '../core/database/isar_database.dart';
import '../core/platform/flutter_platform_info_service.dart';
import '../core/platform/platform_info_service.dart';
import '../core/services/link_opener_service.dart';
import '../core/services/local_permission_service.dart';
import '../core/services/permission_service.dart';
import '../core/services/url_launcher_link_opener_service.dart';
import '../core/time/date_time_provider.dart';
import '../core/time/system_date_time_provider.dart';
import '../features/activities/application/activity_image_service.dart';
import '../features/activities/application/activity_seed_service.dart';
import '../features/activities/data/repositories/isar_activity_repository.dart';
import '../features/activities/data/services/file_picker_activity_image_service.dart';
import '../features/activities/domain/repositories/activity_repository.dart';
import '../features/activities/domain/services/activity_suggestion_service.dart';
import '../features/history/application/history_summary_service.dart';
import '../features/history/data/repositories/isar_history_repository.dart';
import '../features/history/domain/entities/history_entry.dart';
import '../features/history/domain/entities/history_summary.dart';
import '../features/history/domain/repositories/history_repository.dart';
import '../features/reminders/application/reminder_scheduler.dart';
import '../features/reminders/domain/services/next_reminder_calculator.dart';
import '../features/reminders/infrastructure/flutter_local_notification_service.dart';
import '../features/reminders/infrastructure/notification_service.dart';
import '../features/settings/data/repositories/isar_settings_repository.dart';
import '../features/settings/domain/entities/app_settings.dart';
import '../features/settings/domain/repositories/settings_repository.dart';
import '../features/settings/domain/services/settings_validator.dart';

final dateTimeProviderProvider = Provider<DateTimeProvider>(
  (ref) => SystemDateTimeProvider(),
);

final platformInfoServiceProvider = Provider<PlatformInfoService>(
  (ref) => FlutterPlatformInfoService(),
);

final linkOpenerServiceProvider = Provider<LinkOpenerService>(
  (ref) => UrlLauncherLinkOpenerService(),
);

final flutterLocalNotificationsPluginProvider =
    Provider<FlutterLocalNotificationsPlugin>(
      (ref) => FlutterLocalNotificationsPlugin(),
    );

final permissionServiceProvider = Provider<PermissionService>(
  (ref) => LocalPermissionService(
    ref.watch(flutterLocalNotificationsPluginProvider),
  ),
);

final isarProvider = FutureProvider<Isar>((ref) {
  return IsarDatabase.open();
});

final activityRepositoryProvider = FutureProvider<ActivityRepository>((
  ref,
) async {
  final isar = await ref.watch(isarProvider.future);
  return IsarActivityRepository(isar);
});

final activityImageServiceProvider = Provider<ActivityImageService>(
  (ref) => FilePickerActivityImageService(),
);

final settingsRepositoryProvider = FutureProvider<SettingsRepository>((
  ref,
) async {
  final isar = await ref.watch(isarProvider.future);
  return IsarSettingsRepository(
    isar: isar,
    dateTimeProvider: ref.watch(dateTimeProviderProvider),
  );
});

final historyRepositoryProvider = FutureProvider<HistoryRepository>((
  ref,
) async {
  final isar = await ref.watch(isarProvider.future);
  return IsarHistoryRepository(isar);
});

final settingsStreamProvider = StreamProvider<AppSettings>((ref) async* {
  final repository = await ref.watch(settingsRepositoryProvider.future);
  yield* repository.watch();
});

final activeActivitiesProvider = StreamProvider((ref) async* {
  final repository = await ref.watch(activityRepositoryProvider.future);
  yield* repository.watchActiveActivities();
});

final allActivitiesProvider = StreamProvider((ref) async* {
  final repository = await ref.watch(activityRepositoryProvider.future);
  yield* repository.watchAllActivities();
});

final recentHistoryProvider = StreamProvider<List<HistoryEntry>>((ref) async* {
  final repository = await ref.watch(historyRepositoryProvider.future);
  yield* repository.watchRecent();
});

final historySummaryProvider = FutureProvider<HistorySummary>((ref) async {
  final repository = await ref.watch(historyRepositoryProvider.future);
  final now = ref.watch(dateTimeProviderProvider).now();
  final entries = await repository.getEntriesForDay(now);
  return const HistorySummaryService().summarizeToday(
    entries: entries,
    now: now,
  );
});

final notificationTapStreamProvider = Provider<StreamController<String>>((ref) {
  final controller = StreamController<String>.broadcast();
  ref.onDispose(controller.close);
  return controller;
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return FlutterLocalNotificationService(
    ref.watch(flutterLocalNotificationsPluginProvider),
  );
});

final reminderSchedulerProvider = FutureProvider<ReminderScheduler>((
  ref,
) async {
  final activityRepository = await ref.watch(activityRepositoryProvider.future);
  return LocalReminderScheduler(
    notificationService: ref.watch(notificationServiceProvider),
    activityRepository: activityRepository,
    dateTimeProvider: ref.watch(dateTimeProviderProvider),
    calculator: const NextReminderCalculator(),
    suggestionService: const ActivitySuggestionService(),
  );
});

final settingsValidatorProvider = Provider<SettingsValidator>(
  (ref) => const SettingsValidator(),
);

final appBootstrapProvider = FutureProvider<void>((ref) async {
  final notificationService = ref.watch(notificationServiceProvider);
  final tapStream = ref.watch(notificationTapStreamProvider);
  await notificationService.initialize(
    onNotificationTap: (payload) {
      if (payload != null && payload.startsWith('activity:')) {
        tapStream.add(payload.substring('activity:'.length));
      }
    },
  );

  final settingsRepository = await ref.watch(settingsRepositoryProvider.future);
  final activityRepository = await ref.watch(activityRepositoryProvider.future);
  final settings = await settingsRepository.getOrCreate();
  await ActivitySeedService(
    activityRepository: activityRepository,
    dateTimeProvider: ref.watch(dateTimeProviderProvider),
  ).seedDefaultsIfNeeded();
  if (settings.remindersEnabled && settings.notificationsEnabled) {
    final scheduler = await ref.watch(reminderSchedulerProvider.future);
    await scheduler.scheduleNext(settings);
  }
});
