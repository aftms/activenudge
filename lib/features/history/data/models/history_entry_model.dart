import 'package:isar_community/isar.dart';

import '../../domain/entities/history_entry.dart';

part 'history_entry_model.g.dart';

@collection
class HistoryEntryModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String entryId;

  @Index()
  late String activityStableId;

  late String activityTitleEn;
  late String activityTitlePt;

  @Index()
  late DateTime startedAt;

  DateTime? endedAt;
  late int plannedDurationMinutes;
  late int effectiveDurationSeconds;

  @enumerated
  late SessionResult result;

  @enumerated
  late SessionOrigin origin;

  HistoryEntry toEntity() {
    return HistoryEntry(
      entryId: entryId,
      activityStableId: activityStableId,
      activityTitleEn: activityTitleEn,
      activityTitlePt: activityTitlePt,
      startedAt: startedAt,
      endedAt: endedAt,
      plannedDurationMinutes: plannedDurationMinutes,
      effectiveDurationSeconds: effectiveDurationSeconds,
      result: result,
      origin: origin,
    );
  }

  static HistoryEntryModel fromEntity(HistoryEntry entry) {
    return HistoryEntryModel()
      ..entryId = entry.entryId
      ..activityStableId = entry.activityStableId
      ..activityTitleEn = entry.activityTitleEn
      ..activityTitlePt = entry.activityTitlePt
      ..startedAt = entry.startedAt
      ..endedAt = entry.endedAt
      ..plannedDurationMinutes = entry.plannedDurationMinutes
      ..effectiveDurationSeconds = entry.effectiveDurationSeconds
      ..result = entry.result
      ..origin = entry.origin;
  }
}
