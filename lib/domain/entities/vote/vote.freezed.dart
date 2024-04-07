// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VoteEntity _$VoteEntityFromJson(Map<String, dynamic> json) {
  return _VoteEntity.fromJson(json);
}

/// @nodoc
mixin _$VoteEntity {
  String get candidateId => throw _privateConstructorUsedError;
  DateTime get votedAt => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  int get voteCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VoteEntityCopyWith<VoteEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VoteEntityCopyWith<$Res> {
  factory $VoteEntityCopyWith(
          VoteEntity value, $Res Function(VoteEntity) then) =
      _$VoteEntityCopyWithImpl<$Res, VoteEntity>;
  @useResult
  $Res call(
      {String candidateId,
      DateTime votedAt,
      String userId,
      String uuid,
      int voteCount});
}

/// @nodoc
class _$VoteEntityCopyWithImpl<$Res, $Val extends VoteEntity>
    implements $VoteEntityCopyWith<$Res> {
  _$VoteEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidateId = null,
    Object? votedAt = null,
    Object? userId = null,
    Object? uuid = null,
    Object? voteCount = null,
  }) {
    return _then(_value.copyWith(
      candidateId: null == candidateId
          ? _value.candidateId
          : candidateId // ignore: cast_nullable_to_non_nullable
              as String,
      votedAt: null == votedAt
          ? _value.votedAt
          : votedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VoteEntityImplCopyWith<$Res>
    implements $VoteEntityCopyWith<$Res> {
  factory _$$VoteEntityImplCopyWith(
          _$VoteEntityImpl value, $Res Function(_$VoteEntityImpl) then) =
      __$$VoteEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String candidateId,
      DateTime votedAt,
      String userId,
      String uuid,
      int voteCount});
}

/// @nodoc
class __$$VoteEntityImplCopyWithImpl<$Res>
    extends _$VoteEntityCopyWithImpl<$Res, _$VoteEntityImpl>
    implements _$$VoteEntityImplCopyWith<$Res> {
  __$$VoteEntityImplCopyWithImpl(
      _$VoteEntityImpl _value, $Res Function(_$VoteEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? candidateId = null,
    Object? votedAt = null,
    Object? userId = null,
    Object? uuid = null,
    Object? voteCount = null,
  }) {
    return _then(_$VoteEntityImpl(
      candidateId: null == candidateId
          ? _value.candidateId
          : candidateId // ignore: cast_nullable_to_non_nullable
              as String,
      votedAt: null == votedAt
          ? _value.votedAt
          : votedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VoteEntityImpl implements _VoteEntity {
  const _$VoteEntityImpl(
      {required this.candidateId,
      required this.votedAt,
      required this.userId,
      required this.uuid,
      required this.voteCount});

  factory _$VoteEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VoteEntityImplFromJson(json);

  @override
  final String candidateId;
  @override
  final DateTime votedAt;
  @override
  final String userId;
  @override
  final String uuid;
  @override
  final int voteCount;

  @override
  String toString() {
    return 'VoteEntity(candidateId: $candidateId, votedAt: $votedAt, userId: $userId, uuid: $uuid, voteCount: $voteCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VoteEntityImpl &&
            (identical(other.candidateId, candidateId) ||
                other.candidateId == candidateId) &&
            (identical(other.votedAt, votedAt) || other.votedAt == votedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, candidateId, votedAt, userId, uuid, voteCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VoteEntityImplCopyWith<_$VoteEntityImpl> get copyWith =>
      __$$VoteEntityImplCopyWithImpl<_$VoteEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VoteEntityImplToJson(
      this,
    );
  }
}

abstract class _VoteEntity implements VoteEntity {
  const factory _VoteEntity(
      {required final String candidateId,
      required final DateTime votedAt,
      required final String userId,
      required final String uuid,
      required final int voteCount}) = _$VoteEntityImpl;

  factory _VoteEntity.fromJson(Map<String, dynamic> json) =
      _$VoteEntityImpl.fromJson;

  @override
  String get candidateId;
  @override
  DateTime get votedAt;
  @override
  String get userId;
  @override
  String get uuid;
  @override
  int get voteCount;
  @override
  @JsonKey(ignore: true)
  _$$VoteEntityImplCopyWith<_$VoteEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
