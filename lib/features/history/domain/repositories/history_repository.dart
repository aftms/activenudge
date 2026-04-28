import '../entities/history_entry.dart';

abstract interface class HistoryRepository {
  Future<void> add(HistoryEntry entry);
  Future<List<HistoryEntry>> getRecent({int limit = 20});
  Stream<List<HistoryEntry>> watchRecent({int limit = 20});
  Future<List<HistoryEntry>> getEntriesForDay(DateTime day);
}
