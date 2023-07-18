// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCandidateCollection on Isar {
  IsarCollection<Candidate> get candidates => this.collection();
}

const CandidateSchema = CollectionSchema(
  name: r'Candidate',
  id: 7154351146559500304,
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
    r'phoneNumber': PropertySchema(
      id: 4,
      name: r'phoneNumber',
      type: IsarType.string,
    ),
    r'speetch': PropertySchema(
      id: 5,
      name: r'speetch',
      type: IsarType.string,
    ),
    r'status': PropertySchema(
      id: 6,
      name: r'status',
      type: IsarType.bool,
    ),
    r'voteCount': PropertySchema(
      id: 7,
      name: r'voteCount',
      type: IsarType.long,
    ),
    r'voted': PropertySchema(
      id: 8,
      name: r'voted',
      type: IsarType.bool,
    )
  },
  estimateSize: _candidateEstimateSize,
  serialize: _candidateSerialize,
  deserialize: _candidateDeserialize,
  deserializeProp: _candidateDeserializeProp,
  idName: r'userId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _candidateGetId,
  getLinks: _candidateGetLinks,
  attach: _candidateAttach,
  version: '3.1.0+1',
);

int _candidateEstimateSize(
  Candidate object,
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
    final value = object.phoneNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.speetch;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _candidateSerialize(
  Candidate object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.arreaOfStudy);
  writer.writeString(offsets[1], object.fistName);
  writer.writeString(offsets[2], object.grade);
  writer.writeString(offsets[3], object.lastName);
  writer.writeString(offsets[4], object.phoneNumber);
  writer.writeString(offsets[5], object.speetch);
  writer.writeBool(offsets[6], object.status);
  writer.writeLong(offsets[7], object.voteCount);
  writer.writeBool(offsets[8], object.voted);
}

Candidate _candidateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Candidate();
  object.arreaOfStudy = reader.readStringOrNull(offsets[0]);
  object.fistName = reader.readStringOrNull(offsets[1]);
  object.grade = reader.readStringOrNull(offsets[2]);
  object.lastName = reader.readStringOrNull(offsets[3]);
  object.phoneNumber = reader.readStringOrNull(offsets[4]);
  object.speetch = reader.readStringOrNull(offsets[5]);
  object.status = reader.readBoolOrNull(offsets[6]);
  object.userId = id;
  object.voteCount = reader.readLongOrNull(offsets[7]);
  object.voted = reader.readBoolOrNull(offsets[8]);
  return object;
}

P _candidateDeserializeProp<P>(
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
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBoolOrNull(offset)) as P;
    case 7:
      return (reader.readLongOrNull(offset)) as P;
    case 8:
      return (reader.readBoolOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _candidateGetId(Candidate object) {
  return object.userId;
}

List<IsarLinkBase<dynamic>> _candidateGetLinks(Candidate object) {
  return [];
}

void _candidateAttach(IsarCollection<dynamic> col, Id id, Candidate object) {
  object.userId = id;
}

extension CandidateQueryWhereSort
    on QueryBuilder<Candidate, Candidate, QWhere> {
  QueryBuilder<Candidate, Candidate, QAfterWhere> anyUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CandidateQueryWhere
    on QueryBuilder<Candidate, Candidate, QWhereClause> {
  QueryBuilder<Candidate, Candidate, QAfterWhereClause> userIdEqualTo(
      Id userId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: userId,
        upper: userId,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterWhereClause> userIdNotEqualTo(
      Id userId) {
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

  QueryBuilder<Candidate, Candidate, QAfterWhereClause> userIdGreaterThan(
      Id userId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: userId, includeLower: include),
      );
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterWhereClause> userIdLessThan(
      Id userId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: userId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterWhereClause> userIdBetween(
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

extension CandidateQueryFilter
    on QueryBuilder<Candidate, Candidate, QFilterCondition> {
  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      arreaOfStudyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'arreaOfStudy',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      arreaOfStudyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'arreaOfStudy',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> arreaOfStudyEqualTo(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      arreaOfStudyGreaterThan(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      arreaOfStudyLessThan(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> arreaOfStudyBetween(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      arreaOfStudyStartsWith(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      arreaOfStudyEndsWith(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      arreaOfStudyContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'arreaOfStudy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> arreaOfStudyMatches(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      arreaOfStudyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'arreaOfStudy',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      arreaOfStudyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'arreaOfStudy',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> fistNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fistName',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      fistNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fistName',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> fistNameEqualTo(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> fistNameGreaterThan(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> fistNameLessThan(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> fistNameBetween(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> fistNameStartsWith(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> fistNameEndsWith(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> fistNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'fistName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> fistNameMatches(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> fistNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fistName',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      fistNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'fistName',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'grade',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'grade',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeEqualTo(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeGreaterThan(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeLessThan(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeBetween(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeStartsWith(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeEndsWith(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'grade',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'grade',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> gradeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'grade',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> lastNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      lastNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastName',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> lastNameEqualTo(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> lastNameGreaterThan(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> lastNameLessThan(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> lastNameBetween(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> lastNameStartsWith(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> lastNameEndsWith(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> lastNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'lastName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> lastNameMatches(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> lastNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      lastNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'lastName',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      phoneNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      phoneNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phoneNumber',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> phoneNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      phoneNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> phoneNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> phoneNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phoneNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      phoneNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> phoneNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> phoneNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phoneNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> phoneNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phoneNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      phoneNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      phoneNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phoneNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> speetchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'speetch',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> speetchIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'speetch',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> speetchEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speetch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> speetchGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speetch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> speetchLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speetch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> speetchBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speetch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> speetchStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'speetch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> speetchEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'speetch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> speetchContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'speetch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> speetchMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'speetch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> speetchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speetch',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      speetchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'speetch',
        value: '',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> statusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> statusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'status',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> statusEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> userIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userId',
        value: value,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> userIdGreaterThan(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> userIdLessThan(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> userIdBetween(
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

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> voteCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voteCount',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      voteCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voteCount',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> voteCountEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voteCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition>
      voteCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'voteCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> voteCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'voteCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> voteCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'voteCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> votedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'voted',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> votedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'voted',
      ));
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterFilterCondition> votedEqualTo(
      bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'voted',
        value: value,
      ));
    });
  }
}

extension CandidateQueryObject
    on QueryBuilder<Candidate, Candidate, QFilterCondition> {}

extension CandidateQueryLinks
    on QueryBuilder<Candidate, Candidate, QFilterCondition> {}

extension CandidateQuerySortBy on QueryBuilder<Candidate, Candidate, QSortBy> {
  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByArreaOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arreaOfStudy', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByArreaOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arreaOfStudy', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByFistName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fistName', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByFistNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fistName', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortBySpeetch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speetch', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortBySpeetchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speetch', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByVoteCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteCount', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByVoteCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteCount', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByVoted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> sortByVotedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.desc);
    });
  }
}

extension CandidateQuerySortThenBy
    on QueryBuilder<Candidate, Candidate, QSortThenBy> {
  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByArreaOfStudy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arreaOfStudy', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByArreaOfStudyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'arreaOfStudy', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByFistName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fistName', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByFistNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fistName', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByGrade() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByGradeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'grade', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByLastName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByLastNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastName', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByPhoneNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByPhoneNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phoneNumber', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenBySpeetch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speetch', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenBySpeetchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speetch', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByUserId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByUserIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userId', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByVoteCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteCount', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByVoteCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voteCount', Sort.desc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByVoted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.asc);
    });
  }

  QueryBuilder<Candidate, Candidate, QAfterSortBy> thenByVotedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'voted', Sort.desc);
    });
  }
}

extension CandidateQueryWhereDistinct
    on QueryBuilder<Candidate, Candidate, QDistinct> {
  QueryBuilder<Candidate, Candidate, QDistinct> distinctByArreaOfStudy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'arreaOfStudy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Candidate, Candidate, QDistinct> distinctByFistName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fistName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Candidate, Candidate, QDistinct> distinctByGrade(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'grade', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Candidate, Candidate, QDistinct> distinctByLastName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Candidate, Candidate, QDistinct> distinctByPhoneNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phoneNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Candidate, Candidate, QDistinct> distinctBySpeetch(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speetch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Candidate, Candidate, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Candidate, Candidate, QDistinct> distinctByVoteCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voteCount');
    });
  }

  QueryBuilder<Candidate, Candidate, QDistinct> distinctByVoted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'voted');
    });
  }
}

extension CandidateQueryProperty
    on QueryBuilder<Candidate, Candidate, QQueryProperty> {
  QueryBuilder<Candidate, int, QQueryOperations> userIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userId');
    });
  }

  QueryBuilder<Candidate, String?, QQueryOperations> arreaOfStudyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'arreaOfStudy');
    });
  }

  QueryBuilder<Candidate, String?, QQueryOperations> fistNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fistName');
    });
  }

  QueryBuilder<Candidate, String?, QQueryOperations> gradeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'grade');
    });
  }

  QueryBuilder<Candidate, String?, QQueryOperations> lastNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastName');
    });
  }

  QueryBuilder<Candidate, String?, QQueryOperations> phoneNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phoneNumber');
    });
  }

  QueryBuilder<Candidate, String?, QQueryOperations> speetchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speetch');
    });
  }

  QueryBuilder<Candidate, bool?, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Candidate, int?, QQueryOperations> voteCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voteCount');
    });
  }

  QueryBuilder<Candidate, bool?, QQueryOperations> votedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'voted');
    });
  }
}
