import '../entities/app_settings.dart';

abstract interface class SettingsRepository {
  Future<AppSettings> getOrCreate();
  Stream<AppSettings> watch();
  Future<void> save(AppSettings settings);
}
