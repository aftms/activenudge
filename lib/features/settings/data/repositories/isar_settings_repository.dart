import 'package:isar_community/isar.dart';

import '../../../../core/time/date_time_provider.dart';
import '../../domain/entities/app_settings.dart';
import '../../domain/repositories/settings_repository.dart';
import '../models/settings_model.dart';

class IsarSettingsRepository implements SettingsRepository {
  IsarSettingsRepository({
    required Isar isar,
    required DateTimeProvider dateTimeProvider,
  }) : _isar = isar,
       _dateTimeProvider = dateTimeProvider;

  final Isar _isar;
  final DateTimeProvider _dateTimeProvider;

  @override
  Future<AppSettings> getOrCreate() async {
    final existing = await _isar.settingsModels.get(1);
    if (existing != null) {
      return existing.toEntity();
    }
    final defaults = AppSettings.defaults();
    await save(defaults);
    return defaults;
  }

  @override
  Future<void> save(AppSettings settings) async {
    final model = SettingsModel.fromEntity(settings, _dateTimeProvider.now());
    await _isar.writeTxn(() => _isar.settingsModels.put(model));
  }

  @override
  Stream<AppSettings> watch() async* {
    yield await getOrCreate();
    await for (final model in _isar.settingsModels.watchObject(1)) {
      if (model == null) {
        yield await getOrCreate();
      } else {
        yield model.toEntity();
      }
    }
  }
}
