// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

import '../user/user.dart';

part 'candidate.freezed.dart';
part 'candidate.g.dart';

@freezed
class CandidateEntity with _$CandidateEntity {
  const factory CandidateEntity({
    required String slogan,
    required String speech,
    required int vote_count,
    required String uuid,
    required UserEntity user,
  }) = _CandidateEntity;

  factory CandidateEntity.fromJson(Map<String, dynamic> json) =>
      _$CandidateEntityFromJson(json);
}
