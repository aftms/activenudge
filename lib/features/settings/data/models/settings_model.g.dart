// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsModelCollection on Isar {
  IsarCollection<SettingsModel> get settingsModels => this.collection();
}

const SettingsModelSchema = CollectionSchema(
  name: r'SettingsModel',
  id: 4013777327486952906,
  properties: {
    r'activeEndHour': PropertySchema(
      id: 0,
      name: r'activeEndHour',
      type: IsarType.long,
    ),
    r'activeEndMinute': PropertySchema(
      id: 1,
      name: r'activeEndMinute',
      type: IsarType.long,
    ),
    r'activeStartHour': PropertySchema(
      id: 2,
      name: r'activeStartHour',
      type: IsarType.long,
    ),
    r'activeStartMinute': PropertySchema(
      id: 3,
      name: r'activeStartMinute',
      type: IsarType.long,
    ),
    r'activeWeekdays': PropertySchema(
      id: 4,
      name: r'activeWeekdays',
      type: IsarType.longList,
    ),
    r'autoOpenExternalContent': PropertySchema(
      id: 5,
      name: r'autoOpenExternalContent',
      type: IsarType.bool,
    ),
    r'defaultActivityDurationMinutes': PropertySchema(
      id: 6,
      name: r'defaultActivityDurationMinutes',
      type: IsarType.long,
    ),
    r'language': PropertySchema(
      id: 7,
      name: r'language',
      type: IsarType.byte,
      enumMap: _SettingsModellanguageEnumValueMap,
    ),
    r'notificationsEnabled': PropertySchema(
      id: 8,
      name: r'notificationsEnabled',
      type: IsarType.bool,
    ),
    r'reminderIntervalMinutes': PropertySchema(
      id: 9,
      name: r'reminderIntervalMinutes',
      type: IsarType.long,
    ),
    r'remindersEnabled': PropertySchema(
      id: 10,
      name: r'remindersEnabled',
      type: IsarType.bool,
    ),
    r'soundEnabled': PropertySchema(
      id: 11,
      name: r'soundEnabled',
      type: IsarType.bool,
    ),
    r'updatedAt': PropertySchema(
      id: 12,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'vibrationEnabled': PropertySchema(
      id: 13,
      name: r'vibrationEnabled',
      type: IsarType.bool,
    ),
  },

  estimateSize: _settingsModelEstimateSize,
  serialize: _settingsModelSerialize,
  deserialize: _settingsModelDeserialize,
  deserializeProp: _settingsModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _settingsModelGetId,
  getLinks: _settingsModelGetLinks,
  attach: _settingsModelAttach,
  version: '3.3.2',
);

int _settingsModelEstimateSize(
  SettingsModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.activeWeekdays.length * 8;
  return bytesCount;
}

void _settingsModelSerialize(
  SettingsModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.activeEndHour);
  writer.writeLong(offsets[1], object.activeEndMinute);
  writer.writeLong(offsets[2], object.activeStartHour);
  writer.writeLong(offsets[3], object.activeStartMinute);
  writer.writeLongList(offsets[4], object.activeWeekdays);
  writer.writeBool(offsets[5], object.autoOpenExternalContent);
  writer.writeLong(offsets[6], object.defaultActivityDurationMinutes);
  writer.writeByte(offsets[7], object.language.index);
  writer.writeBool(offsets[8], object.notificationsEnabled);
  writer.writeLong(offsets[9], object.reminderIntervalMinutes);
  writer.writeBool(offsets[10], object.remindersEnabled);
  writer.writeBool(offsets[11], object.soundEnabled);
  writer.writeDateTime(offsets[12], object.updatedAt);
  writer.writeBool(offsets[13], object.vibrationEnabled);
}

SettingsModel _settingsModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingsModel();
  object.activeEndHour = reader.readLong(offsets[0]);
  object.activeEndMinute = reader.readLong(offsets[1]);
  object.activeStartHour = reader.readLong(offsets[2]);
  object.activeStartMinute = reader.readLong(offsets[3]);
  object.activeWeekdays = reader.readLongList(offsets[4]) ?? [];
  object.autoOpenExternalContent = reader.readBool(offsets[5]);
  object.defaultActivityDurationMinutes = reader.readLong(offsets[6]);
  object.id = id;
  object.language =
      _SettingsModellanguageValueEnumMap[reader.readByteOrNull(offsets[7])] ??
      AppLanguage.system;
  object.notificationsEnabled = reader.readBool(offsets[8]);
  object.reminderIntervalMinutes = reader.readLong(offsets[9]);
  object.remindersEnabled = reader.readBool(offsets[10]);
  object.soundEnabled = reader.readBool(offsets[11]);
  object.updatedAt = reader.readDateTime(offsets[12]);
  object.vibrationEnabled = reader.readBool(offsets[13]);
  return object;
}

P _settingsModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLongList(offset) ?? []) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (_SettingsModellanguageValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              AppLanguage.system)
          as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readBool(offset)) as P;
    case 12:
      return (reader.readDateTime(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SettingsModellanguageEnumValueMap = {
  'system': 0,
  'english': 1,
  'portuguese': 2,
};
const _SettingsModellanguageValueEnumMap = {
  0: AppLanguage.system,
  1: AppLanguage.english,
  2: AppLanguage.portuguese,
};

Id _settingsModelGetId(SettingsModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingsModelGetLinks(SettingsModel object) {
  return [];
}

void _settingsModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  SettingsModel object,
) {
  object.id = id;
}

extension SettingsModelQueryWhereSort
    on QueryBuilder<SettingsModel, SettingsModel, QWhere> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsModelQueryWhere
    on QueryBuilder<SettingsModel, SettingsModel, QWhereClause> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idNotEqualTo(
    Id id,
  ) {
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

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterWhereClause> idBetween(
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
}

extension SettingsModelQueryFilter
    on QueryBuilder<SettingsModel, SettingsModel, QFilterCondition> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeEndHourEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activeEndHour', value: value),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeEndHourGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activeEndHour',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeEndHourLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activeEndHour',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeEndHourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activeEndHour',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeEndMinuteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activeEndMinute', value: value),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeEndMinuteGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activeEndMinute',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeEndMinuteLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activeEndMinute',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeEndMinuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activeEndMinute',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeStartHourEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activeStartHour', value: value),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeStartHourGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activeStartHour',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeStartHourLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activeStartHour',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeStartHourBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activeStartHour',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeStartMinuteEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activeStartMinute', value: value),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeStartMinuteGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activeStartMinute',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeStartMinuteLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activeStartMinute',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeStartMinuteBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activeStartMinute',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeWeekdaysElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'activeWeekdays', value: value),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeWeekdaysElementGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'activeWeekdays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeWeekdaysElementLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'activeWeekdays',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeWeekdaysElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'activeWeekdays',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeWeekdaysLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'activeWeekdays', length, true, length, true);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeWeekdaysIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'activeWeekdays', 0, true, 0, true);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeWeekdaysIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'activeWeekdays', 0, false, 999999, true);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeWeekdaysLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'activeWeekdays', 0, true, length, include);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeWeekdaysLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'activeWeekdays', length, include, 999999, true);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  activeWeekdaysLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'activeWeekdays',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  autoOpenExternalContentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'autoOpenExternalContent',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  defaultActivityDurationMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'defaultActivityDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  defaultActivityDurationMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'defaultActivityDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  defaultActivityDurationMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'defaultActivityDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  defaultActivityDurationMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'defaultActivityDurationMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
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

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  languageEqualTo(AppLanguage value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'language', value: value),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  languageGreaterThan(AppLanguage value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'language',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  languageLessThan(AppLanguage value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'language',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  languageBetween(
    AppLanguage lower,
    AppLanguage upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'language',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  notificationsEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'notificationsEnabled',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  reminderIntervalMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'reminderIntervalMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  reminderIntervalMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'reminderIntervalMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  reminderIntervalMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'reminderIntervalMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  reminderIntervalMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'reminderIntervalMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  remindersEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'remindersEnabled', value: value),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  soundEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'soundEnabled', value: value),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  updatedAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterFilterCondition>
  vibrationEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'vibrationEnabled', value: value),
      );
    });
  }
}

extension SettingsModelQueryObject
    on QueryBuilder<SettingsModel, SettingsModel, QFilterCondition> {}

extension SettingsModelQueryLinks
    on QueryBuilder<SettingsModel, SettingsModel, QFilterCondition> {}

extension SettingsModelQuerySortBy
    on QueryBuilder<SettingsModel, SettingsModel, QSortBy> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByActiveEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeEndHour', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByActiveEndHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeEndHour', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByActiveEndMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeEndMinute', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByActiveEndMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeEndMinute', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByActiveStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStartHour', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByActiveStartHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStartHour', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByActiveStartMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStartMinute', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByActiveStartMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStartMinute', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByAutoOpenExternalContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoOpenExternalContent', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByAutoOpenExternalContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoOpenExternalContent', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByDefaultActivityDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultActivityDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByDefaultActivityDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultActivityDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByReminderIntervalMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderIntervalMinutes', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByReminderIntervalMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderIntervalMinutes', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByRemindersEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByRemindersEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortBySoundEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortBySoundEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByVibrationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  sortByVibrationEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.desc);
    });
  }
}

extension SettingsModelQuerySortThenBy
    on QueryBuilder<SettingsModel, SettingsModel, QSortThenBy> {
  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByActiveEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeEndHour', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByActiveEndHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeEndHour', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByActiveEndMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeEndMinute', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByActiveEndMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeEndMinute', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByActiveStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStartHour', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByActiveStartHourDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStartHour', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByActiveStartMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStartMinute', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByActiveStartMinuteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'activeStartMinute', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByAutoOpenExternalContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoOpenExternalContent', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByAutoOpenExternalContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'autoOpenExternalContent', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByDefaultActivityDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultActivityDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByDefaultActivityDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'defaultActivityDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByLanguageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'language', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByNotificationsEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationsEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByReminderIntervalMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderIntervalMinutes', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByReminderIntervalMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reminderIntervalMinutes', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByRemindersEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByRemindersEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remindersEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenBySoundEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenBySoundEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByVibrationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QAfterSortBy>
  thenByVibrationEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'vibrationEnabled', Sort.desc);
    });
  }
}

extension SettingsModelQueryWhereDistinct
    on QueryBuilder<SettingsModel, SettingsModel, QDistinct> {
  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctByActiveEndHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeEndHour');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctByActiveEndMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeEndMinute');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctByActiveStartHour() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeStartHour');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctByActiveStartMinute() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeStartMinute');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctByActiveWeekdays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'activeWeekdays');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctByAutoOpenExternalContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'autoOpenExternalContent');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctByDefaultActivityDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'defaultActivityDurationMinutes');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByLanguage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'language');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctByNotificationsEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationsEnabled');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctByReminderIntervalMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reminderIntervalMinutes');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctByRemindersEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remindersEnabled');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctBySoundEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soundEnabled');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<SettingsModel, SettingsModel, QDistinct>
  distinctByVibrationEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'vibrationEnabled');
    });
  }
}

extension SettingsModelQueryProperty
    on QueryBuilder<SettingsModel, SettingsModel, QQueryProperty> {
  QueryBuilder<SettingsModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SettingsModel, int, QQueryOperations> activeEndHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeEndHour');
    });
  }

  QueryBuilder<SettingsModel, int, QQueryOperations> activeEndMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeEndMinute');
    });
  }

  QueryBuilder<SettingsModel, int, QQueryOperations> activeStartHourProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeStartHour');
    });
  }

  QueryBuilder<SettingsModel, int, QQueryOperations>
  activeStartMinuteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeStartMinute');
    });
  }

  QueryBuilder<SettingsModel, List<int>, QQueryOperations>
  activeWeekdaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'activeWeekdays');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations>
  autoOpenExternalContentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'autoOpenExternalContent');
    });
  }

  QueryBuilder<SettingsModel, int, QQueryOperations>
  defaultActivityDurationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'defaultActivityDurationMinutes');
    });
  }

  QueryBuilder<SettingsModel, AppLanguage, QQueryOperations>
  languageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'language');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations>
  notificationsEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationsEnabled');
    });
  }

  QueryBuilder<SettingsModel, int, QQueryOperations>
  reminderIntervalMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reminderIntervalMinutes');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations>
  remindersEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remindersEnabled');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations> soundEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soundEnabled');
    });
  }

  QueryBuilder<SettingsModel, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<SettingsModel, bool, QQueryOperations>
  vibrationEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'vibrationEnabled');
    });
  }
}
