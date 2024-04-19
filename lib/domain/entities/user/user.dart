// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String? uuid,
    required String email,
    required String password,
    required String first_name,
    required String last_name,
    required String grade,
    required String area_of_study,
    required String? image,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
