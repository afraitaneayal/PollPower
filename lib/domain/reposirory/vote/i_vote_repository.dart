import '../../entities/vote/vote.dart';
import '../../params/vote/create_vote_param.dart';
import '../../params/vote/get_vote_param.dart';

abstract class IVoteRepository {
  Future<VoteEntity> vote(CreateVoteParam param);
  Future<List<VoteEntity>> getVotes(GetVoteParam param);
  Future<VoteEntity> getVote(GetVoteParam param);
}
