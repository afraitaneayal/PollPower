// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CandidateEntity _$CandidateEntityFromJson(Map<String, dynamic> json) {
  return _CandidateEntity.fromJson(json);
}

/// @nodoc
mixin _$CandidateEntity {
  String get slogan => throw _privateConstructorUsedError;
  String get speech => throw _privateConstructorUsedError;
  int get vote_count => throw _privateConstructorUsedError;
  String get uuid => throw _privateConstructorUsedError;
  UserEntity get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CandidateEntityCopyWith<CandidateEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidateEntityCopyWith<$Res> {
  factory $CandidateEntityCopyWith(
          CandidateEntity value, $Res Function(CandidateEntity) then) =
      _$CandidateEntityCopyWithImpl<$Res, CandidateEntity>;
  @useResult
  $Res call(
      {String slogan,
      String speech,
      int vote_count,
      String uuid,
      UserEntity user});

  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$CandidateEntityCopyWithImpl<$Res, $Val extends CandidateEntity>
    implements $CandidateEntityCopyWith<$Res> {
  _$CandidateEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slogan = null,
    Object? speech = null,
    Object? vote_count = null,
    Object? uuid = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      slogan: null == slogan
          ? _value.slogan
          : slogan // ignore: cast_nullable_to_non_nullable
              as String,
      speech: null == speech
          ? _value.speech
          : speech // ignore: cast_nullable_to_non_nullable
              as String,
      vote_count: null == vote_count
          ? _value.vote_count
          : vote_count // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res> get user {
    return $UserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CandidateEntityImplCopyWith<$Res>
    implements $CandidateEntityCopyWith<$Res> {
  factory _$$CandidateEntityImplCopyWith(_$CandidateEntityImpl value,
          $Res Function(_$CandidateEntityImpl) then) =
      __$$CandidateEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String slogan,
      String speech,
      int vote_count,
      String uuid,
      UserEntity user});

  @override
  $UserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$CandidateEntityImplCopyWithImpl<$Res>
    extends _$CandidateEntityCopyWithImpl<$Res, _$CandidateEntityImpl>
    implements _$$CandidateEntityImplCopyWith<$Res> {
  __$$CandidateEntityImplCopyWithImpl(
      _$CandidateEntityImpl _value, $Res Function(_$CandidateEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slogan = null,
    Object? speech = null,
    Object? vote_count = null,
    Object? uuid = null,
    Object? user = null,
  }) {
    return _then(_$CandidateEntityImpl(
      slogan: null == slogan
          ? _value.slogan
          : slogan // ignore: cast_nullable_to_non_nullable
              as String,
      speech: null == speech
          ? _value.speech
          : speech // ignore: cast_nullable_to_non_nullable
              as String,
      vote_count: null == vote_count
          ? _value.vote_count
          : vote_count // ignore: cast_nullable_to_non_nullable
              as int,
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CandidateEntityImpl implements _CandidateEntity {
  const _$CandidateEntityImpl(
      {required this.slogan,
      required this.speech,
      required this.vote_count,
      required this.uuid,
      required this.user});

  factory _$CandidateEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidateEntityImplFromJson(json);

  @override
  final String slogan;
  @override
  final String speech;
  @override
  final int vote_count;
  @override
  final String uuid;
  @override
  final UserEntity user;

  @override
  String toString() {
    return 'CandidateEntity(slogan: $slogan, speech: $speech, vote_count: $vote_count, uuid: $uuid, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidateEntityImpl &&
            (identical(other.slogan, slogan) || other.slogan == slogan) &&
            (identical(other.speech, speech) || other.speech == speech) &&
            (identical(other.vote_count, vote_count) ||
                other.vote_count == vote_count) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, slogan, speech, vote_count, uuid, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidateEntityImplCopyWith<_$CandidateEntityImpl> get copyWith =>
      __$$CandidateEntityImplCopyWithImpl<_$CandidateEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidateEntityImplToJson(
      this,
    );
  }
}

abstract class _CandidateEntity implements CandidateEntity {
  const factory _CandidateEntity(
      {required final String slogan,
      required final String speech,
      required final int vote_count,
      required final String uuid,
      required final UserEntity user}) = _$CandidateEntityImpl;

  factory _CandidateEntity.fromJson(Map<String, dynamic> json) =
      _$CandidateEntityImpl.fromJson;

  @override
  String get slogan;
  @override
  String get speech;
  @override
  int get vote_count;
  @override
  String get uuid;
  @override
  UserEntity get user;
  @override
  @JsonKey(ignore: true)
  _$$CandidateEntityImplCopyWith<_$CandidateEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
