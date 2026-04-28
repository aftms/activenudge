// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetActivityModelCollection on Isar {
  IsarCollection<ActivityModel> get activityModels => this.collection();
}

const ActivityModelSchema = CollectionSchema(
  name: r'ActivityModel',
  id: -6385501004358380311,
  properties: {
    r'category': PropertySchema(
      id: 0,
      name: r'category',
      type: IsarType.byte,
      enumMap: _ActivityModelcategoryEnumValueMap,
    ),
    r'contentType': PropertySchema(
      id: 1,
      name: r'contentType',
      type: IsarType.byte,
      enumMap: _ActivityModelcontentTypeEnumValueMap,
    ),
    r'createdAt': PropertySchema(
      id: 2,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'descriptionEn': PropertySchema(
      id: 3,
      name: r'descriptionEn',
      type: IsarType.string,
    ),
    r'descriptionPt': PropertySchema(
      id: 4,
      name: r'descriptionPt',
      type: IsarType.string,
    ),
    r'imagePath': PropertySchema(
      id: 5,
      name: r'imagePath',
      type: IsarType.string,
    ),
    r'instructionsEn': PropertySchema(
      id: 6,
      name: r'instructionsEn',
      type: IsarType.string,
    ),
    r'instructionsPt': PropertySchema(
      id: 7,
      name: r'instructionsPt',
      type: IsarType.string,
    ),
    r'intensity': PropertySchema(
      id: 8,
      name: r'intensity',
      type: IsarType.byte,
      enumMap: _ActivityModelintensityEnumValueMap,
    ),
    r'isActive': PropertySchema(id: 9, name: r'isActive', type: IsarType.bool),
    r'stableId': PropertySchema(
      id: 10,
      name: r'stableId',
      type: IsarType.string,
    ),
    r'suggestedDurationMinutes': PropertySchema(
      id: 11,
      name: r'suggestedDurationMinutes',
      type: IsarType.long,
    ),
    r'titleEn': PropertySchema(id: 12, name: r'titleEn', type: IsarType.string),
    r'titlePt': PropertySchema(id: 13, name: r'titlePt', type: IsarType.string),
    r'updatedAt': PropertySchema(
      id: 14,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'url': PropertySchema(id: 15, name: r'url', type: IsarType.string),
  },

  estimateSize: _activityModelEstimateSize,
  serialize: _activityModelSerialize,
  deserialize: _activityModelDeserialize,
  deserializeProp: _activityModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'stableId': IndexSchema(
      id: 8172736602419351792,
      name: r'stableId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'stableId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _activityModelGetId,
  getLinks: _activityModelGetLinks,
  attach: _activityModelAttach,
  version: '3.3.2',
);

int _activityModelEstimateSize(
  ActivityModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.descriptionEn.length * 3;
  bytesCount += 3 + object.descriptionPt.length * 3;
  {
    final value = object.imagePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.instructionsEn.length * 3;
  bytesCount += 3 + object.instructionsPt.length * 3;
  bytesCount += 3 + object.stableId.length * 3;
  bytesCount += 3 + object.titleEn.length * 3;
  bytesCount += 3 + object.titlePt.length * 3;
  {
    final value = object.url;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _activityModelSerialize(
  ActivityModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.category.index);
  writer.writeByte(offsets[1], object.contentType.index);
  writer.writeDateTime(offsets[2], object.createdAt);
  writer.writeString(offsets[3], object.descriptionEn);
  writer.writeString(offsets[4], object.descriptionPt);
  writer.writeString(offsets[5], object.imagePath);
  writer.writeString(offsets[6], object.instructionsEn);
  writer.writeString(offsets[7], object.instructionsPt);
  writer.writeByte(offsets[8], object.intensity.index);
  writer.writeBool(offsets[9], object.isActive);
  writer.writeString(offsets[10], object.stableId);
  writer.writeLong(offsets[11], object.suggestedDurationMinutes);
  writer.writeString(offsets[12], object.titleEn);
  writer.writeString(offsets[13], object.titlePt);
  writer.writeDateTime(offsets[14], object.updatedAt);
  writer.writeString(offsets[15], object.url);
}

ActivityModel _activityModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ActivityModel();
  object.category =
      _ActivityModelcategoryValueEnumMap[reader.readByteOrNull(offsets[0])] ??
      ActivityCategory.mobility;
  object.contentType =
      _ActivityModelcontentTypeValueEnumMap[reader.readByteOrNull(
        offsets[1],
      )] ??
      ActivityContentType.text;
  object.createdAt = reader.readDateTime(offsets[2]);
  object.descriptionEn = reader.readString(offsets[3]);
  object.descriptionPt = reader.readString(offsets[4]);
  object.id = id;
  object.imagePath = reader.readStringOrNull(offsets[5]);
  object.instructionsEn = reader.readString(offsets[6]);
  object.instructionsPt = reader.readString(offsets[7]);
  object.intensity =
      _ActivityModelintensityValueEnumMap[reader.readByteOrNull(offsets[8])] ??
      ActivityIntensity.low;
  object.isActive = reader.readBool(offsets[9]);
  object.stableId = reader.readString(offsets[10]);
  object.suggestedDurationMinutes = reader.readLong(offsets[11]);
  object.titleEn = reader.readString(offsets[12]);
  object.titlePt = reader.readString(offsets[13]);
  object.updatedAt = reader.readDateTime(offsets[14]);
  object.url = reader.readStringOrNull(offsets[15]);
  return object;
}

P _activityModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_ActivityModelcategoryValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              ActivityCategory.mobility)
          as P;
    case 1:
      return (_ActivityModelcontentTypeValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              ActivityContentType.text)
          as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (_ActivityModelintensityValueEnumMap[reader.readByteOrNull(
                offset,
              )] ??
              ActivityIntensity.low)
          as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readDateTime(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ActivityModelcategoryEnumValueMap = {
  'mobility': 0,
  'strength': 1,
  'cardio': 2,
  'breathing': 3,
};
const _ActivityModelcategoryValueEnumMap = {
  0: ActivityCategory.mobility,
  1: ActivityCategory.strength,
  2: ActivityCategory.cardio,
  3: ActivityCategory.breathing,
};
const _ActivityModelcontentTypeEnumValueMap = {
  'text': 0,
  'image': 1,
  'externalLink': 2,
  'externalVideo': 3,
};
const _ActivityModelcontentTypeValueEnumMap = {
  0: ActivityContentType.text,
  1: ActivityContentType.image,
  2: ActivityContentType.externalLink,
  3: ActivityContentType.externalVideo,
};
const _ActivityModelintensityEnumValueMap = {'low': 0, 'medium': 1, 'high': 2};
const _ActivityModelintensityValueEnumMap = {
  0: ActivityIntensity.low,
  1: ActivityIntensity.medium,
  2: ActivityIntensity.high,
};

Id _activityModelGetId(ActivityModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _activityModelGetLinks(ActivityModel object) {
  return [];
}

void _activityModelAttach(
  IsarCollection<dynamic> col,
  Id id,
  ActivityModel object,
) {
  object.id = id;
}

extension ActivityModelByIndex on IsarCollection<ActivityModel> {
  Future<ActivityModel?> getByStableId(String stableId) {
    return getByIndex(r'stableId', [stableId]);
  }

  ActivityModel? getByStableIdSync(String stableId) {
    return getByIndexSync(r'stableId', [stableId]);
  }

  Future<bool> deleteByStableId(String stableId) {
    return deleteByIndex(r'stableId', [stableId]);
  }

  bool deleteByStableIdSync(String stableId) {
    return deleteByIndexSync(r'stableId', [stableId]);
  }

  Future<List<ActivityModel?>> getAllByStableId(List<String> stableIdValues) {
    final values = stableIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'stableId', values);
  }

  List<ActivityModel?> getAllByStableIdSync(List<String> stableIdValues) {
    final values = stableIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'stableId', values);
  }

  Future<int> deleteAllByStableId(List<String> stableIdValues) {
    final values = stableIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'stableId', values);
  }

  int deleteAllByStableIdSync(List<String> stableIdValues) {
    final values = stableIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'stableId', values);
  }

  Future<Id> putByStableId(ActivityModel object) {
    return putByIndex(r'stableId', object);
  }

  Id putByStableIdSync(ActivityModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'stableId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByStableId(List<ActivityModel> objects) {
    return putAllByIndex(r'stableId', objects);
  }

  List<Id> putAllByStableIdSync(
    List<ActivityModel> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'stableId', objects, saveLinks: saveLinks);
  }
}

extension ActivityModelQueryWhereSort
    on QueryBuilder<ActivityModel, ActivityModel, QWhere> {
  QueryBuilder<ActivityModel, ActivityModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ActivityModelQueryWhere
    on QueryBuilder<ActivityModel, ActivityModel, QWhereClause> {
  QueryBuilder<ActivityModel, ActivityModel, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ActivityModel, ActivityModel, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterWhereClause> idBetween(
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

  QueryBuilder<ActivityModel, ActivityModel, QAfterWhereClause> stableIdEqualTo(
    String stableId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'stableId', value: [stableId]),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterWhereClause>
  stableIdNotEqualTo(String stableId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stableId',
                lower: [],
                upper: [stableId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stableId',
                lower: [stableId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stableId',
                lower: [stableId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'stableId',
                lower: [],
                upper: [stableId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension ActivityModelQueryFilter
    on QueryBuilder<ActivityModel, ActivityModel, QFilterCondition> {
  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  categoryEqualTo(ActivityCategory value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'category', value: value),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  categoryGreaterThan(ActivityCategory value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'category',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  categoryLessThan(ActivityCategory value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'category',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  categoryBetween(
    ActivityCategory lower,
    ActivityCategory upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'category',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  contentTypeEqualTo(ActivityContentType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'contentType', value: value),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  contentTypeGreaterThan(ActivityContentType value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'contentType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  contentTypeLessThan(ActivityContentType value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'contentType',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  contentTypeBetween(
    ActivityContentType lower,
    ActivityContentType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'contentType',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  createdAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  createdAtLessThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionEnEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'descriptionEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'descriptionEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'descriptionEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'descriptionEn',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionEnStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'descriptionEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionEnEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'descriptionEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'descriptionEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'descriptionEn',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'descriptionEn', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'descriptionEn', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionPtEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'descriptionPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionPtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'descriptionPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionPtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'descriptionPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionPtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'descriptionPt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionPtStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'descriptionPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionPtEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'descriptionPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionPtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'descriptionPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionPtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'descriptionPt',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionPtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'descriptionPt', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  descriptionPtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'descriptionPt', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
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

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'imagePath'),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'imagePath'),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'imagePath',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'imagePath',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'imagePath',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'imagePath', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  imagePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'imagePath', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsEnEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'instructionsEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'instructionsEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'instructionsEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'instructionsEn',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsEnStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'instructionsEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsEnEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'instructionsEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'instructionsEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'instructionsEn',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'instructionsEn', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'instructionsEn', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsPtEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'instructionsPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsPtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'instructionsPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsPtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'instructionsPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsPtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'instructionsPt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsPtStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'instructionsPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsPtEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'instructionsPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsPtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'instructionsPt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsPtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'instructionsPt',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsPtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'instructionsPt', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  instructionsPtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'instructionsPt', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  intensityEqualTo(ActivityIntensity value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'intensity', value: value),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  intensityGreaterThan(ActivityIntensity value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'intensity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  intensityLessThan(ActivityIntensity value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'intensity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  intensityBetween(
    ActivityIntensity lower,
    ActivityIntensity upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'intensity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  isActiveEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isActive', value: value),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  stableIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'stableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  stableIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  stableIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  stableIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stableId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  stableIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'stableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  stableIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'stableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  stableIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'stableId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  stableIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'stableId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  stableIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stableId', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  stableIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'stableId', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  suggestedDurationMinutesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'suggestedDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  suggestedDurationMinutesGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'suggestedDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  suggestedDurationMinutesLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'suggestedDurationMinutes',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  suggestedDurationMinutesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'suggestedDurationMinutes',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titleEnEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'titleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titleEnGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'titleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titleEnLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'titleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titleEnBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'titleEn',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titleEnStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'titleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titleEnEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'titleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titleEnContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'titleEn',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titleEnMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'titleEn',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titleEnIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'titleEn', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titleEnIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'titleEn', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titlePtEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'titlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titlePtGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'titlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titlePtLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'titlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titlePtBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'titlePt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titlePtStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'titlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titlePtEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'titlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titlePtContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'titlePt',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titlePtMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'titlePt',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titlePtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'titlePt', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  titlePtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'titlePt', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
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

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
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

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
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

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  urlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'url'),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  urlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'url'),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition> urlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  urlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition> urlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition> urlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'url',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  urlStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition> urlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition> urlContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'url',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition> urlMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'url',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  urlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'url', value: ''),
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterFilterCondition>
  urlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'url', value: ''),
      );
    });
  }
}

extension ActivityModelQueryObject
    on QueryBuilder<ActivityModel, ActivityModel, QFilterCondition> {}

extension ActivityModelQueryLinks
    on QueryBuilder<ActivityModel, ActivityModel, QFilterCondition> {}

extension ActivityModelQuerySortBy
    on QueryBuilder<ActivityModel, ActivityModel, QSortBy> {
  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByContentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByContentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByDescriptionEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionEn', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByDescriptionEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionEn', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByDescriptionPt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionPt', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByDescriptionPtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionPt', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByInstructionsEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructionsEn', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByInstructionsEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructionsEn', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByInstructionsPt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructionsPt', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByInstructionsPtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructionsPt', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByStableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stableId', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByStableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stableId', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortBySuggestedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortBySuggestedDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByTitleEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByTitleEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByTitlePt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titlePt', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByTitlePtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titlePt', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> sortByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension ActivityModelQuerySortThenBy
    on QueryBuilder<ActivityModel, ActivityModel, QSortThenBy> {
  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByCategoryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'category', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByContentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByContentTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'contentType', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByDescriptionEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionEn', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByDescriptionEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionEn', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByDescriptionPt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionPt', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByDescriptionPtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'descriptionPt', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByImagePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByImagePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imagePath', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByInstructionsEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructionsEn', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByInstructionsEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructionsEn', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByInstructionsPt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructionsPt', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByInstructionsPtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructionsPt', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'intensity', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByIsActiveDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isActive', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByStableId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stableId', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByStableIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stableId', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenBySuggestedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedDurationMinutes', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenBySuggestedDurationMinutesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'suggestedDurationMinutes', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByTitleEn() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByTitleEnDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titleEn', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByTitlePt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titlePt', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByTitlePtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'titlePt', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.asc);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QAfterSortBy> thenByUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'url', Sort.desc);
    });
  }
}

extension ActivityModelQueryWhereDistinct
    on QueryBuilder<ActivityModel, ActivityModel, QDistinct> {
  QueryBuilder<ActivityModel, ActivityModel, QDistinct> distinctByCategory() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'category');
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct>
  distinctByContentType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'contentType');
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct>
  distinctByDescriptionEn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'descriptionEn',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct>
  distinctByDescriptionPt({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'descriptionPt',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct> distinctByImagePath({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagePath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct>
  distinctByInstructionsEn({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'instructionsEn',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct>
  distinctByInstructionsPt({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'instructionsPt',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct> distinctByIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'intensity');
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct> distinctByIsActive() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isActive');
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct> distinctByStableId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stableId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct>
  distinctBySuggestedDurationMinutes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'suggestedDurationMinutes');
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct> distinctByTitleEn({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titleEn', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct> distinctByTitlePt({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'titlePt', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<ActivityModel, ActivityModel, QDistinct> distinctByUrl({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'url', caseSensitive: caseSensitive);
    });
  }
}

extension ActivityModelQueryProperty
    on QueryBuilder<ActivityModel, ActivityModel, QQueryProperty> {
  QueryBuilder<ActivityModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ActivityModel, ActivityCategory, QQueryOperations>
  categoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'category');
    });
  }

  QueryBuilder<ActivityModel, ActivityContentType, QQueryOperations>
  contentTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'contentType');
    });
  }

  QueryBuilder<ActivityModel, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<ActivityModel, String, QQueryOperations>
  descriptionEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptionEn');
    });
  }

  QueryBuilder<ActivityModel, String, QQueryOperations>
  descriptionPtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'descriptionPt');
    });
  }

  QueryBuilder<ActivityModel, String?, QQueryOperations> imagePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagePath');
    });
  }

  QueryBuilder<ActivityModel, String, QQueryOperations>
  instructionsEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instructionsEn');
    });
  }

  QueryBuilder<ActivityModel, String, QQueryOperations>
  instructionsPtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instructionsPt');
    });
  }

  QueryBuilder<ActivityModel, ActivityIntensity, QQueryOperations>
  intensityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'intensity');
    });
  }

  QueryBuilder<ActivityModel, bool, QQueryOperations> isActiveProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isActive');
    });
  }

  QueryBuilder<ActivityModel, String, QQueryOperations> stableIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stableId');
    });
  }

  QueryBuilder<ActivityModel, int, QQueryOperations>
  suggestedDurationMinutesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'suggestedDurationMinutes');
    });
  }

  QueryBuilder<ActivityModel, String, QQueryOperations> titleEnProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titleEn');
    });
  }

  QueryBuilder<ActivityModel, String, QQueryOperations> titlePtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'titlePt');
    });
  }

  QueryBuilder<ActivityModel, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<ActivityModel, String?, QQueryOperations> urlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'url');
    });
  }
}
