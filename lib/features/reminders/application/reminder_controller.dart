import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../domain/services/next_reminder_calculator.dart';
import '../../settings/domain/entities/app_settings.dart';

class ReminderController {
  ReminderController(this._ref);

  final Ref _ref;

  Future<DateTime?> refreshSchedule(AppSettings settings) async {
    final scheduler = await _ref.read(reminderSchedulerProvider.future);
    if (!settings.remindersEnabled || !settings.notificationsEnabled) {
      await scheduler.cancelAll();
      return null;
    }
    return scheduler.scheduleNext(settings);
  }

  Future<void> cancelAll() async {
    final scheduler = await _ref.read(reminderSchedulerProvider.future);
    await scheduler.cancelAll();
  }
}

final reminderControllerProvider = Provider<ReminderController>(
  ReminderController.new,
);

final nextReminderPreviewProvider = FutureProvider<DateTime?>((ref) async {
  final settings = await ref.watch(settingsStreamProvider.future);
  return const NextReminderCalculator().calculateNext(
    from: ref.watch(dateTimeProviderProvider).now(),
    settings: settings,
  );
});
