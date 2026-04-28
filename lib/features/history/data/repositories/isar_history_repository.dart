import 'package:isar_community/isar.dart';

import '../../domain/entities/history_entry.dart';
import '../../domain/repositories/history_repository.dart';
import '../models/history_entry_model.dart';

class IsarHistoryRepository implements HistoryRepository {
  IsarHistoryRepository(this._isar);

  final Isar _isar;

  @override
  Future<void> add(HistoryEntry entry) async {
    await _isar.writeTxn(
      () => _isar.historyEntryModels.put(HistoryEntryModel.fromEntity(entry)),
    );
  }

  @override
  Future<List<HistoryEntry>> getEntriesForDay(DateTime day) async {
    final start = DateTime(day.year, day.month, day.day);
    final end = start.add(const Duration(days: 1));
    final models = await _isar.historyEntryModels
        .filter()
        .startedAtBetween(start, end, includeUpper: false)
        .sortByStartedAtDesc()
        .findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<HistoryEntry>> getRecent({int limit = 20}) async {
    final models = await _isar.historyEntryModels
        .where()
        .sortByStartedAtDesc()
        .limit(limit)
        .findAll();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Stream<List<HistoryEntry>> watchRecent({int limit = 20}) async* {
    final query = _isar.historyEntryModels.where().sortByStartedAtDesc().limit(
      limit,
    );
    yield (await query.findAll()).map((model) => model.toEntity()).toList();
    await for (final models in query.watch(fireImmediately: false)) {
      yield models.map((model) => model.toEntity()).toList();
    }
  }
}
