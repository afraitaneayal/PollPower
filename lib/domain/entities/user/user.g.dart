// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      uuid: json['uuid'] as String?,
      email: json['email'] as String,
      password: json['password'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      grade: json['grade'] as String,
      area_of_study: json['area_of_study'] as String,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'email': instance.email,
      'password': instance.password,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'grade': instance.grade,
      'area_of_study': instance.area_of_study,
      'image': instance.image,
    };
