import 'package:isar_community/isar.dart';

import '../../domain/entities/activity.dart';
import '../../domain/repositories/activity_repository.dart';
import '../models/activity_model.dart';

class IsarActivityRepository implements ActivityRepository {
  IsarActivityRepository(this._isar);

  final Isar _isar;

  @override
  Future<int> countActivities() {
    return _isar.activityModels.count();
  }

  @override
  Future<List<Activity>> getAllActivities() async {
    final models = await _isar.activityModels.where().sortByTitleEn().findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<Activity>> getActiveActivities() async {
    final models = await _isar.activityModels
        .filter()
        .isActiveEqualTo(true)
        .sortByTitleEn()
        .findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Activity?> getByStableId(String stableId) async {
    final model = await _isar.activityModels
        .filter()
        .stableIdEqualTo(stableId)
        .findFirst();
    return model?.toEntity();
  }

  @override
  Future<void> upsert(Activity activity) async {
    await upsertMany(<Activity>[activity]);
  }

  @override
  Future<void> upsertMany(List<Activity> activities) async {
    await _isar.writeTxn(() async {
      for (final activity in activities) {
        final existing = await _isar.activityModels
            .filter()
            .stableIdEqualTo(activity.stableId)
            .findFirst();
        final model = ActivityModel.fromEntity(activity);
        if (existing != null) {
          model.id = existing.id;
        }
        await _isar.activityModels.put(model);
      }
    });
  }

  @override
  Stream<List<Activity>> watchAllActivities() async* {
    final query = _isar.activityModels.where().sortByTitleEn();
    yield (await query.findAll()).map((model) => model.toEntity()).toList();
    await for (final models in query.watch(fireImmediately: false)) {
      yield models.map((model) => model.toEntity()).toList();
    }
  }

  @override
  Stream<List<Activity>> watchActiveActivities() async* {
    final query = _isar.activityModels
        .filter()
        .isActiveEqualTo(true)
        .sortByTitleEn();
    yield (await query.findAll()).map((model) => model.toEntity()).toList();
    await for (final models in query.watch(fireImmediately: false)) {
      yield models.map((model) => model.toEntity()).toList();
    }
  }
}
