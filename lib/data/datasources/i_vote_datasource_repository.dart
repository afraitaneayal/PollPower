import 'package:poll_power/data/models/transform.dart';
import 'package:poll_power/domain/entities/vote/vote.dart';
import 'package:poll_power/domain/params/vote/create_vote_param.dart';
import 'package:poll_power/domain/params/vote/get_vote_param.dart';

abstract class IVoteDatasourceRepository with TransformTo {
  Future<VoteEntity> getVote(GetVoteParam param);
  Future<List<VoteEntity>> getVotes();
  Future<VoteEntity> vote(CreateVoteParam param);
}
