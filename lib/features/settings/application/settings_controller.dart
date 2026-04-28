import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/providers.dart';
import '../domain/entities/app_settings.dart';
import '../domain/services/settings_validator.dart';

class SettingsController {
  SettingsController(this._ref);

  final Ref _ref;

  Future<List<SettingsValidationError>> save(AppSettings settings) async {
    final validator = _ref.read(settingsValidatorProvider);
    final errors = validator.validate(settings);
    if (errors.isNotEmpty) {
      return errors;
    }
    final repository = await _ref.read(settingsRepositoryProvider.future);
    await repository.save(settings);
    final scheduler = await _ref.read(reminderSchedulerProvider.future);
    if (settings.remindersEnabled && settings.notificationsEnabled) {
      await _ref.read(permissionServiceProvider).requestNotifications();
      await scheduler.scheduleNext(settings);
    } else {
      await scheduler.cancelAll();
    }
    _ref.invalidate(historySummaryProvider);
    return const <SettingsValidationError>[];
  }
}

final settingsControllerProvider = Provider<SettingsController>(
  SettingsController.new,
);
