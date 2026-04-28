// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_entry_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHistoryEntryModelCollection on Isar {
  IsarCollection<HistoryEntryModel> get historyEntryModels => this.collection();
}

const HistoryEntryModelSchema = CollectionSchema(
  name: r'HistoryEntryModel',
  id: 4793774238523355989,
  properties: {
    r'activityStableId': PropertySchema(
      id: 0,
      name: r'activityStableId',
      type: IsarType.string,
    ),
    r'activityTitleEn': PropertySchema(
      id: 1,
      name: r'activityTitleEn',
      type: IsarType.string,
    ),
    r'activityTitlePt': PropertySchema(
      id: 2,
      name: r'activityTitlePt',
      type: IsarType.string,
    ),
    r'effectiveDurationSeconds': PropertySchema(
      id: 3,
      name: r'effectiveDurationSeconds',
      type: IsarType.long,
    ),
    r'endedAt': PropertySchema(
      id: 4,
      name: r'endedAt',
      type: IsarType.dateTime,
    ),
    r'entryId': PropertySchema(id: 5, name: r'entryId', type: IsarType.string),
    r'origin': PropertySchema(
      id: 6,
      name: r'origin',
      type: IsarType.byte,
      enumMap: _HistoryEntryModeloriginEnumValueMap,
    ),
    r'plannedDurationMinutes': PropertySchema(
      id: 7,
      name: r'plannedDurationMinutes',
      type: IsarType.long,
    ),
    r'result': PropertySchema(
      id: 8,
      name: r'result',
      type: IsarType.byte,
      enumMap: _HistoryEntryModelresultEnumValueMap,
    ),
    r'startedAt': PropertySchema(
      id: 9,
      name: r'startedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _historyEntryModelEstimateSize,
  serialize: _historyEntryModelSerialize,
  deserialize: _historyEntryModelDeserialize,
  deserializeProp: _historyEntryModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'entryId': IndexSchema(
      id: 3733379884318738402,
      name: r'entryId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'entryId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'activityStableId': IndexSchema(
      id: -5920153030630045564,
      name: r'activityStableId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'activityStableId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'startedAt': IndexSchema(
      id: 8114395319341636597,
      name: r'startedAt',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'startedAt',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _historyEntryModelGetId,
  getLinks: _historyEntryModelGetLinks,
  attach: _historyEntryModelAttach,
  version: '3.3.2',
);

int _historyEntryModelEstimateSize(
  HistoryEntryModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activityStableId.length * 3;
  bytesCount += 3 + object.activityTitleEn.length * 3;
  bytesCount += 3 + object.activityTitlePt.length * 3;
  bytesCount += 3 + object.entryId.length * 3;
  return bytesCount;
}

void _historyEntryModelSerialize(
  HistoryEntryModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.activityStableId);
  writer.writeString(offsets[1], object.activityTitleEn);
  writer.writeString(offsets[2], object.activityTitlePt);
  writer.writeLong(offsets[3], object.effectiveDurationSeconds);
  writer.writeDateTime(offsets[4], object.endedAt);
  writer.writeString(offsets[5], object.entryId);
  writer.writeByte(offsets[6], object.origin.index);
  writer.writeLong(offsets[7], object.plannedDurationMinutes);
  writer.writeByte(offsets[8], object.result.index);
  writer.writeDateTime(offsets[9], object.startedAt);
}

HistoryEntryModel _historyEntryModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HistoryEntryModel();
  object.activityStableId = reader.readString(offsets[0]);
  object.activityTitleEn = reader.readString(offsets[1]);
  object.activityTitlePt = reader.readString(offsets[2]);
  object.effectiveDurationSeconds = reader.readLong(offsets[3]);
  object.endedAt = reader.readDateTimeOrNull(offsets[4]);
  object.entryId = reader.readString(offsets[5]);
  object.id = id;
  object.origin =
      _HistoryEntryModeloriginValueEnumMap[reader.readByteOrNull(offsets[6])] ??
      SessionOrigin.reminder;
  object.plannedDurationMinutes = reader.readLong(offsets[7]);
  object.result =
      _HistoryEntryModelresultValueEnumMap[reader.readByteOrNull(offsets[8])] ??
      SessionResult.completed;
  object.startedAt = reader.readDateTime(offsets[9]);
  return object;
}

P _historyEntryModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (_HistoryEntryModeloriginValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              SessionOrigin.reminder)
          as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (_HistoryEntryModelresultValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              SessionResult.completed)
          as P;
    case 9:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _HistoryEntryModeloriginEnumValueMap = {'reminder': 0, 'manual': 1};
const _HistoryEntryModeloriginValueEnumMap = {
  0: SessionOrigin.reminder,
  1: SessionOrigin.manual,
};
const _HistoryEntryModelresultEnumValueMap = {
  'completed': 0,
  'skipped': 1,
  'expired': 2,
};
const _HistoryEntryModelresultValueEnumMap = {
  0: SessionResult.completed,
  1: SessionResult.skipped,
  2: SessionResult.expired,
};

Id _historyEntryModelGetId(HistoryEntryModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _historyEntryModelGetLinks(
  HistoryEntryModel object,
) {
  return [];
}

void _historyEntryModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  HistoryEntryModel object,
) {
  object.id = id;
}

extension HistoryEntryModelByIndex on IsarCollection<HistoryEntryModel> {
  Future<HistoryEntryModel?> getByEntryId(String entryId) {
    return getByIndex(r'entryId', [entryId]);
  }

  HistoryEntryModel? getByEntryIdSync(String entryId) {
    return getByIndexSync(r'entryId', [entryId]);
  }

  Future<bool> deleteByEntryId(String entryId) {
    return deleteByIndex(r'entryId', [entryId]);
  }

  bool deleteByEntryIdSync(String entryId) {
    return deleteByIndexSync(r'entryId', [entryId]);
  }

  Future<List<HistoryEntryModel?>> getAllByEntryId(List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'entryId', values);
  }

  List<HistoryEntryModel?> getAllByEntryIdSync(List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'entryId', values);
  }

  Future<int> deleteAllByEntryId(List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'entryId', values);
  }

  int deleteAllByEntryIdSync(List<String> entryIdValues) {
    final values = entryIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'entryId', values);
  }

  Future<Id> putByEntryId(HistoryEntryModel object) {
    return putByIndex(r'entryId', object);
  }

  Id putByEntryIdSync(HistoryEntryModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'entryId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByEntryId(List<HistoryEntryModel> objects) {
    return putAllByIndex(r'entryId', objects);
  }

  List<Id> putAllByEntryIdSync(
    List<HistoryEntryModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'entryId', objects, saveLinks: saveLinks);
  }
}

extension HistoryEntryModelQueryWhereSort
    on QueryBuilder<HistoryEntryModel, HistoryEntryModel, QWhere> {
  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhere>
  anyStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'startedAt'),
      );
    });
  }
}

extension HistoryEntryModelQueryWhere
    on QueryBuilder<HistoryEntryModel, HistoryEntryModel, QWhereClause> {
  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  entryIdEqualTo(String entryId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'entryId', value: [entryId]),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  entryIdNotEqualTo(String entryId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entryId',
                lower: [],
                upper: [entryId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entryId',
                lower: [entryId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entryId',
                lower: [entryId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'entryId',
                lower: [],
                upper: [entryId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  activityStableIdEqualTo(String activityStableId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(
          indexName: r'activityStableId',
          value: [activityStableId],
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  activityStableIdNotEqualTo(String activityStableId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityStableId',
                lower: [],
                upper: [activityStableId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityStableId',
                lower: [activityStableId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityStableId',
                lower: [activityStableId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'activityStableId',
                lower: [],
                upper: [activityStableId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  startedAtEqualTo(DateTime startedAt) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'startedAt', value: [startedAt]),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  startedAtNotEqualTo(DateTime startedAt) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startedAt',
                lower: [],
                upper: [startedAt],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startedAt',
                lower: [startedAt],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startedAt',
                lower: [startedAt],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'startedAt',
                lower: [],
                upper: [startedAt],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  startedAtGreaterThan(DateTime startedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'startedAt',
          lower: [startedAt],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  startedAtLessThan(DateTime startedAt, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'startedAt',
          lower: [],
          upper: [startedAt],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterWhereClause>
  startedAtBetween(
    DateTime lowerStartedAt,
    DateTime upperStartedAt, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'startedAt',
          lower: [lowerStartedAt],
          includeLower: includeLower,
          upper: [upperStartedAt],
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension HistoryEntryModelQueryFilter
    on QueryBuilder<HistoryEntryModel, HistoryEntryModel, QFilterCondition> {
  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityStableIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'activityStableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityStableIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activityStableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityStableIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activityStableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityStableIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activityStableId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityStableIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'activityStableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityStableIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'activityStableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityStableIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'activityStableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityStableIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'activityStableId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityStableIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activityStableId', value: ''),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityStableIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'activityStableId', value: ''),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitleEnEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'activityTitleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitleEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activityTitleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitleEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activityTitleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitleEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activityTitleEn',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitleEnStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'activityTitleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitleEnEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'activityTitleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitleEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'activityTitleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitleEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'activityTitleEn',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitleEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activityTitleEn', value: ''),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitleEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'activityTitleEn', value: ''),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitlePtEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'activityTitlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitlePtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activityTitlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitlePtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activityTitlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitlePtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activityTitlePt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitlePtStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'activityTitlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitlePtEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'activityTitlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitlePtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'activityTitlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitlePtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'activityTitlePt',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitlePtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activityTitlePt', value: ''),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  activityTitlePtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'activityTitlePt', value: ''),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  effectiveDurationSecondsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'effectiveDurationSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  effectiveDurationSecondsGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'effectiveDurationSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  effectiveDurationSecondsLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'effectiveDurationSeconds',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  effectiveDurationSecondsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'effectiveDurationSeconds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  endedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'endedAt'),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  endedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'endedAt'),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  endedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'endedAt', value: value),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  endedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'endedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  endedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'endedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  endedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'endedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  entryIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'entryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  entryIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'entryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  entryIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'entryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  entryIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'entryId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  entryIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'entryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  entryIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'entryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  entryIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'entryId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  entryIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'entryId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  entryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'entryId', value: ''),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  entryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'entryId', value: ''),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  originEqualTo(SessionOrigin value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'origin', value: value),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  originGreaterThan(SessionOrigin value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'origin',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  originLessThan(SessionOrigin value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'origin',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  originBetween(
    SessionOrigin lower,
    SessionOrigin upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'origin',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  plannedDurationMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'plannedDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  plannedDurationMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'plannedDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  plannedDurationMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'plannedDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  plannedDurationMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'plannedDurationMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  resultEqualTo(SessionResult value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'result', value: value),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  resultGreaterThan(SessionResult value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'result',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  resultLessThan(SessionResult value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'result',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  resultBetween(
    SessionResult lower,
    SessionResult upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'result',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  startedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'startedAt', value: value),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  startedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  startedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'startedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterFilterCondition>
  startedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'startedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension HistoryEntryModelQueryObject
    on QueryBuilder<HistoryEntryModel, HistoryEntryModel, QFilterCondition> {}

extension HistoryEntryModelQueryLinks
    on QueryBuilder<HistoryEntryModel, HistoryEntryModel, QFilterCondition> {}

extension HistoryEntryModelQuerySortBy
    on QueryBuilder<HistoryEntryModel, HistoryEntryModel, QSortBy> {
  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByActivityStableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityStableId', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByActivityStableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityStableId', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByActivityTitleEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityTitleEn', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByActivityTitleEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityTitleEn', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByActivityTitlePt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityTitlePt', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByActivityTitlePtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityTitlePt', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByEffectiveDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDurationSeconds', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByEffectiveDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDurationSeconds', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByPlannedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByPlannedDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  sortByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }
}

extension HistoryEntryModelQuerySortThenBy
    on QueryBuilder<HistoryEntryModel, HistoryEntryModel, QSortThenBy> {
  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByActivityStableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityStableId', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByActivityStableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityStableId', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByActivityTitleEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityTitleEn', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByActivityTitleEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityTitleEn', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByActivityTitlePt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityTitlePt', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByActivityTitlePtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activityTitlePt', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByEffectiveDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDurationSeconds', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByEffectiveDurationSecondsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'effectiveDurationSeconds', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByEndedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'endedAt', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByEntryId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByEntryIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'entryId', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByOriginDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'origin', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByPlannedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByPlannedDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'plannedDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByResultDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'result', Sort.desc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.asc);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QAfterSortBy>
  thenByStartedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'startedAt', Sort.desc);
    });
  }
}

extension HistoryEntryModelQueryWhereDistinct
    on QueryBuilder<HistoryEntryModel, HistoryEntryModel, QDistinct> {
  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QDistinct>
  distinctByActivityStableId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'activityStableId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QDistinct>
  distinctByActivityTitleEn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'activityTitleEn',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QDistinct>
  distinctByActivityTitlePt({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'activityTitlePt',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QDistinct>
  distinctByEffectiveDurationSeconds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'effectiveDurationSeconds');
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QDistinct>
  distinctByEndedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'endedAt');
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QDistinct>
  distinctByEntryId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'entryId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QDistinct>
  distinctByOrigin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'origin');
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QDistinct>
  distinctByPlannedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'plannedDurationMinutes');
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QDistinct>
  distinctByResult() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'result');
    });
  }

  QueryBuilder<HistoryEntryModel, HistoryEntryModel, QDistinct>
  distinctByStartedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'startedAt');
    });
  }
}

extension HistoryEntryModelQueryProperty
    on QueryBuilder<HistoryEntryModel, HistoryEntryModel, QQueryProperty> {
  QueryBuilder<HistoryEntryModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HistoryEntryModel, String, QQueryOperations>
  activityStableIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityStableId');
    });
  }

  QueryBuilder<HistoryEntryModel, String, QQueryOperations>
  activityTitleEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityTitleEn');
    });
  }

  QueryBuilder<HistoryEntryModel, String, QQueryOperations>
  activityTitlePtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activityTitlePt');
    });
  }

  QueryBuilder<HistoryEntryModel, int, QQueryOperations>
  effectiveDurationSecondsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'effectiveDurationSeconds');
    });
  }

  QueryBuilder<HistoryEntryModel, DateTime?, QQueryOperations>
  endedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'endedAt');
    });
  }

  QueryBuilder<HistoryEntryModel, String, QQueryOperations> entryIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'entryId');
    });
  }

  QueryBuilder<HistoryEntryModel, SessionOrigin, QQueryOperations>
  originProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'origin');
    });
  }

  QueryBuilder<HistoryEntryModel, int, QQueryOperations>
  plannedDurationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'plannedDurationMinutes');
    });
  }

  QueryBuilder<HistoryEntryModel, SessionResult, QQueryOperations>
  resultProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'result');
    });
  }

  QueryBuilder<HistoryEntryModel, DateTime, QQueryOperations>
  startedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'startedAt');
    });
  }
}
