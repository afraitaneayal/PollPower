import 'package:freezed_annotation/freezed_annotation.dart';

part 'vote.freezed.dart';
part 'vote.g.dart';

@freezed
class VoteEntity with _$VoteEntity {
  const factory VoteEntity({
    required String candidateId,
    required DateTime votedAt,
    required String userId,
    required String uuid,
    required int voteCount,
  }) = _VoteEntity;

  factory VoteEntity.fromJson(Map<String, dynamic> json) =>
      _$VoteEntityFromJson(json);
}
