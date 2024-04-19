// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

JwtObject _$JwtObjectFromJson(Map<String, dynamic> json) {
  return _JwtObject.fromJson(json);
}

/// @nodoc
mixin _$JwtObject {
  String get refresh_token => throw _privateConstructorUsedError;
  String get token => throw _privateConstructorUsedError;
  String get key => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JwtObjectCopyWith<JwtObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JwtObjectCopyWith<$Res> {
  factory $JwtObjectCopyWith(JwtObject value, $Res Function(JwtObject) then) =
      _$JwtObjectCopyWithImpl<$Res, JwtObject>;
  @useResult
  $Res call({String refresh_token, String token, String key});
}

/// @nodoc
class _$JwtObjectCopyWithImpl<$Res, $Val extends JwtObject>
    implements $JwtObjectCopyWith<$Res> {
  _$JwtObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refresh_token = null,
    Object? token = null,
    Object? key = null,
  }) {
    return _then(_value.copyWith(
      refresh_token: null == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$JwtObjectImplCopyWith<$Res>
    implements $JwtObjectCopyWith<$Res> {
  factory _$$JwtObjectImplCopyWith(
          _$JwtObjectImpl value, $Res Function(_$JwtObjectImpl) then) =
      __$$JwtObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String refresh_token, String token, String key});
}

/// @nodoc
class __$$JwtObjectImplCopyWithImpl<$Res>
    extends _$JwtObjectCopyWithImpl<$Res, _$JwtObjectImpl>
    implements _$$JwtObjectImplCopyWith<$Res> {
  __$$JwtObjectImplCopyWithImpl(
      _$JwtObjectImpl _value, $Res Function(_$JwtObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? refresh_token = null,
    Object? token = null,
    Object? key = null,
  }) {
    return _then(_$JwtObjectImpl(
      refresh_token: null == refresh_token
          ? _value.refresh_token
          : refresh_token // ignore: cast_nullable_to_non_nullable
              as String,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$JwtObjectImpl implements _JwtObject {
  const _$JwtObjectImpl(
      {required this.refresh_token, required this.token, required this.key});

  factory _$JwtObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$JwtObjectImplFromJson(json);

  @override
  final String refresh_token;
  @override
  final String token;
  @override
  final String key;

  @override
  String toString() {
    return 'JwtObject(refresh_token: $refresh_token, token: $token, key: $key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JwtObjectImpl &&
            (identical(other.refresh_token, refresh_token) ||
                other.refresh_token == refresh_token) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.key, key) || other.key == key));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, refresh_token, token, key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JwtObjectImplCopyWith<_$JwtObjectImpl> get copyWith =>
      __$$JwtObjectImplCopyWithImpl<_$JwtObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JwtObjectImplToJson(
      this,
    );
  }
}

abstract class _JwtObject implements JwtObject {
  const factory _JwtObject(
      {required final String refresh_token,
      required final String token,
      required final String key}) = _$JwtObjectImpl;

  factory _JwtObject.fromJson(Map<String, dynamic> json) =
      _$JwtObjectImpl.fromJson;

  @override
  String get refresh_token;
  @override
  String get token;
  @override
  String get key;
  @override
  @JsonKey(ignore: true)
  _$$JwtObjectImplCopyWith<_$JwtObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
