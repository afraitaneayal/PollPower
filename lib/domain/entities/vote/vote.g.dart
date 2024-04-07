// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoteEntityImpl _$$VoteEntityImplFromJson(Map<String, dynamic> json) =>
    _$VoteEntityImpl(
      candidateId: json['candidateId'] as String,
      votedAt: DateTime.parse(json['votedAt'] as String),
      userId: json['userId'] as String,
      uuid: json['uuid'] as String,
      voteCount: json['voteCount'] as int,
    );

Map<String, dynamic> _$$VoteEntityImplToJson(_$VoteEntityImpl instance) =>
    <String, dynamic>{
      'candidateId': instance.candidateId,
      'votedAt': instance.votedAt.toIso8601String(),
      'userId': instance.userId,
      'uuid': instance.uuid,
      'voteCount': instance.voteCount,
    };
