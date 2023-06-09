// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetUserCollection on Isar {
  IsarCollection<User> get users => this.collection();
}

const UserSchema = CollectionSchema(
  name: r'User',
  id: -7838171048429979076,
  properties: {
    r'arreaOfStudy': PropertySchema(
      id: 0,
      name: r'arreaOfStudy',
      type: IsarType.string,
    ),
    r'fistName': PropertySchema(
      id: 1,
      name: r'fistName',
      type: IsarType.string,
    ),
    r'grade': PropertySchema(
      id: 2,
      name: r'grade',
      type: IsarType.string,
    ),
    r'lastName': PropertySchema(
      id: 3,
      name: r'lastName',
      type: IsarType.string,
    ),
    r'password': PropertySchema(
      id: 4,
      name: r'password',
      type: IsarType.string,
    ),
    r'voted': PropertySchema(
      id: 5,
      name: r'voted',
      type: IsarType.bool,
    )
  },
  estimateSize: _userEstimateSize,
  serialize: _userSerialize,
  deserialize: _userDeserialize,
  deserializeProp: _userDeserializeProp,
  idName: r'userId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _userGetId,
  getLinks: _userGetLinks,
  attach: _userAttach,
  version: '3.1.0+1',
);

int _userEstimateSize(
  User object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.arreaOfStudy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.fistName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.grade;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.lastName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.password;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _userSerialize(
  User object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.arreaOfStudy);
  writer.writeString(offsets[1], object.fistName);
  writer.writeString(offsets[2], object.grade);
  writer.writeString(offsets[3], object.lastName);
  writer.writeString(offsets[4], object.password);
  writer.writeBool(offsets[5], object.voted);
}

User _userDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = User();
  object.arreaOfStudy = reader.readStringOrNull(offsets[0]);
  object.fistName = reader.readStringOrNull(offsets[1]);
  object.grade = reader.readStringOrNull(offsets[2]);
  object.lastName = reader.readStringOrNull(offsets[3]);
  object.password = reader.readStringOrNull(offsets[4]);
  object.userId = id;
  object.voted = reader.readBoolOrNull(offsets[5]);
  return object;
}

P _userDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _userGetId(User object) {
  return object.userId;
}

List<IsarLinkBase<dynamic>> _userGetLinks(User object) {
  return [];
}

void _userAttach(IsarCollection<dynamic> col, Id id, User object) {
  object.userId = id;
}

extension UserQueryWhereSort on QueryBuilder<User, User, QWhere> {
  QueryBuilder<User, User, QAfterWhere> anyUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension UserQueryWhere on QueryBuilder<User, User, QWhereClause> {
  QueryBuilder<User, User, QAfterWhereClause> userIdEqualTo(Id userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: userId,
        upper: userId,
      ));
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> userIdNotEqualTo(Id userId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: userId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: userId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: userId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: userId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> userIdGreaterThan(Id userId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: userId, includeLower: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> userIdLessThan(Id userId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: userId, includeUpper: include),
      );
    });
  }

  QueryBuilder<User, User, QAfterWhereClause> userIdBetween(
    Id lowerUserId,
    Id upperUserId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerUserId,
        includeLower: includeLower,
        upper: upperUserId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension UserQueryFilter on QueryBuilder<User, User, QFilterCondition> {
  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'arreaOfStudy',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'arreaOfStudy',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'arreaOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'arreaOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'arreaOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'arreaOfStudy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'arreaOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'arreaOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'arreaOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'arreaOfStudy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'arreaOfStudy',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> arreaOfStudyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'arreaOfStudy',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fistName',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fistName',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fistName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'fistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'fistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'fistName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fistName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> fistNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fistName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grade',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grade',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'grade',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> gradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'lastName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'password',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'password',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'password',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'password',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'password',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'password',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> passwordIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'password',
        value: '',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> userIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> votedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voted',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> votedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voted',
      ));
    });
  }

  QueryBuilder<User, User, QAfterFilterCondition> votedEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voted',
        value: value,
      ));
    });
  }
}

extension UserQueryObject on QueryBuilder<User, User, QFilterCondition> {}

extension UserQueryLinks on QueryBuilder<User, User, QFilterCondition> {}

extension UserQuerySortBy on QueryBuilder<User, User, QSortBy> {
  QueryBuilder<User, User, QAfterSortBy> sortByArreaOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arreaOfStudy', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByArreaOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arreaOfStudy', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByFistName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fistName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByFistNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fistName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPassword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByPasswordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByVoted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> sortByVotedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.desc);
    });
  }
}

extension UserQuerySortThenBy on QueryBuilder<User, User, QSortThenBy> {
  QueryBuilder<User, User, QAfterSortBy> thenByArreaOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arreaOfStudy', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByArreaOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arreaOfStudy', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByFistName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fistName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByFistNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fistName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPassword() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByPasswordDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'password', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByVoted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.asc);
    });
  }

  QueryBuilder<User, User, QAfterSortBy> thenByVotedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.desc);
    });
  }
}

extension UserQueryWhereDistinct on QueryBuilder<User, User, QDistinct> {
  QueryBuilder<User, User, QDistinct> distinctByArreaOfStudy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'arreaOfStudy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByFistName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fistName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByLastName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByPassword(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'password', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<User, User, QDistinct> distinctByVoted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voted');
    });
  }
}

extension UserQueryProperty on QueryBuilder<User, User, QQueryProperty> {
  QueryBuilder<User, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<User, String?, QQueryOperations> arreaOfStudyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'arreaOfStudy');
    });
  }

  QueryBuilder<User, String?, QQueryOperations> fistNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fistName');
    });
  }

  QueryBuilder<User, String?, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<User, String?, QQueryOperations> lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<User, String?, QQueryOperations> passwordProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'password');
    });
  }

  QueryBuilder<User, bool?, QQueryOperations> votedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voted');
    });
  }
}
