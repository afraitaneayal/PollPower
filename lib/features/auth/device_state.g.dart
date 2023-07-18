// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_state.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDeviceStateCollection on Isar {
  IsarCollection<DeviceState> get deviceStates => this.collection();
}

const DeviceStateSchema = CollectionSchema(
  name: r'DeviceState',
  id: 188501412964603646,
  properties: {
    r'voted': PropertySchema(
      id: 0,
      name: r'voted',
      type: IsarType.bool,
    )
  },
  estimateSize: _deviceStateEstimateSize,
  serialize: _deviceStateSerialize,
  deserialize: _deviceStateDeserialize,
  deserializeProp: _deviceStateDeserializeProp,
  idName: r'deviceID',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _deviceStateGetId,
  getLinks: _deviceStateGetLinks,
  attach: _deviceStateAttach,
  version: '3.1.0+1',
);

int _deviceStateEstimateSize(
  DeviceState object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _deviceStateSerialize(
  DeviceState object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.voted);
}

DeviceState _deviceStateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DeviceState();
  object.deviceID = id;
  object.voted = reader.readBoolOrNull(offsets[0]);
  return object;
}

P _deviceStateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _deviceStateGetId(DeviceState object) {
  return object.deviceID;
}

List<IsarLinkBase<dynamic>> _deviceStateGetLinks(DeviceState object) {
  return [];
}

void _deviceStateAttach(
    IsarCollection<dynamic> col, Id id, DeviceState object) {
  object.deviceID = id;
}

extension DeviceStateQueryWhereSort
    on QueryBuilder<DeviceState, DeviceState, QWhere> {
  QueryBuilder<DeviceState, DeviceState, QAfterWhere> anyDeviceID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DeviceStateQueryWhere
    on QueryBuilder<DeviceState, DeviceState, QWhereClause> {
  QueryBuilder<DeviceState, DeviceState, QAfterWhereClause> deviceIDEqualTo(
      Id deviceID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: deviceID,
        upper: deviceID,
      ));
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterWhereClause> deviceIDNotEqualTo(
      Id deviceID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: deviceID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: deviceID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: deviceID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: deviceID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterWhereClause> deviceIDGreaterThan(
      Id deviceID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: deviceID, includeLower: include),
      );
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterWhereClause> deviceIDLessThan(
      Id deviceID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: deviceID, includeUpper: include),
      );
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterWhereClause> deviceIDBetween(
    Id lowerDeviceID,
    Id upperDeviceID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerDeviceID,
        includeLower: includeLower,
        upper: upperDeviceID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DeviceStateQueryFilter
    on QueryBuilder<DeviceState, DeviceState, QFilterCondition> {
  QueryBuilder<DeviceState, DeviceState, QAfterFilterCondition> deviceIDEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'deviceID',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterFilterCondition>
      deviceIDGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'deviceID',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterFilterCondition>
      deviceIDLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'deviceID',
        value: value,
      ));
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterFilterCondition> deviceIDBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'deviceID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterFilterCondition> votedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voted',
      ));
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterFilterCondition>
      votedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voted',
      ));
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterFilterCondition> votedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voted',
        value: value,
      ));
    });
  }
}

extension DeviceStateQueryObject
    on QueryBuilder<DeviceState, DeviceState, QFilterCondition> {}

extension DeviceStateQueryLinks
    on QueryBuilder<DeviceState, DeviceState, QFilterCondition> {}

extension DeviceStateQuerySortBy
    on QueryBuilder<DeviceState, DeviceState, QSortBy> {
  QueryBuilder<DeviceState, DeviceState, QAfterSortBy> sortByVoted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.asc);
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterSortBy> sortByVotedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.desc);
    });
  }
}

extension DeviceStateQuerySortThenBy
    on QueryBuilder<DeviceState, DeviceState, QSortThenBy> {
  QueryBuilder<DeviceState, DeviceState, QAfterSortBy> thenByDeviceID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceID', Sort.asc);
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterSortBy> thenByDeviceIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'deviceID', Sort.desc);
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterSortBy> thenByVoted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.asc);
    });
  }

  QueryBuilder<DeviceState, DeviceState, QAfterSortBy> thenByVotedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.desc);
    });
  }
}

extension DeviceStateQueryWhereDistinct
    on QueryBuilder<DeviceState, DeviceState, QDistinct> {
  QueryBuilder<DeviceState, DeviceState, QDistinct> distinctByVoted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voted');
    });
  }
}

extension DeviceStateQueryProperty
    on QueryBuilder<DeviceState, DeviceState, QQueryProperty> {
  QueryBuilder<DeviceState, int, QQueryOperations> deviceIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'deviceID');
    });
  }

  QueryBuilder<DeviceState, bool?, QQueryOperations> votedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voted');
    });
  }
}
