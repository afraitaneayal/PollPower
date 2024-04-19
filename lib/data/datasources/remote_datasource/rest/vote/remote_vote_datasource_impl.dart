import 'package:injectable/injectable.dart';
import 'package:poll_power/data/datasources/i_vote_datasource_repository.dart';
import 'package:poll_power/domain/entities/vote/vote.dart';
import 'package:poll_power/domain/params/vote/create_vote_param.dart';
import 'package:poll_power/domain/params/vote/get_vote_param.dart';

@Singleton(as: IVoteDatasourceRepository)
class VoteDatasourceImpl implements IVoteDatasourceRepository {
  @override
  Future<VoteEntity?> getVote(GetVoteParam param) {
    // TODO: implement getVote
    throw UnimplementedError();
  }

  @override
  Future<List<VoteEntity>> getVotes() {
    // TODO: implement getVotes
    throw UnimplementedError();
  }

  @override
  transform(param) {
    // TODO: implement transform
    throw UnimplementedError();
  }

  @override
  Future<VoteEntity> vote(CreateVoteParam param) {
    // TODO: implement vote
    throw UnimplementedError();
  }
}
