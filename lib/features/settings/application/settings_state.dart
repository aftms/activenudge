import '../domain/entities/app_settings.dart';
import '../domain/services/settings_validator.dart';

class SettingsState {
  const SettingsState({
    required this.settings,
    this.errors = const <SettingsValidationError>[],
    this.saved = false,
  });

  final AppSettings settings;
  final List<SettingsValidationError> errors;
  final bool saved;

  SettingsState copyWith({
    AppSettings? settings,
    List<SettingsValidationError>? errors,
    bool? saved,
  }) {
    return SettingsState(
      settings: settings ?? this.settings,
      errors: errors ?? this.errors,
      saved: saved ?? this.saved,
    );
  }
}
