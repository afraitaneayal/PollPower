import 'package:injectable/injectable.dart';
import 'package:poll_power/data/datasources/i_vote_datasource_repository.dart';
import 'package:poll_power/domain/entities/vote/vote.dart';
import 'package:poll_power/domain/params/vote/create_vote_param.dart';
import 'package:poll_power/domain/params/vote/get_vote_param.dart';
import 'package:poll_power/domain/reposirory/vote/i_vote_repository.dart';

@Singleton(as: IVoteRepository)
class VoteRepository implements IVoteRepository {
  final IVoteDatasourceRepository _voteDatasourceRepository;

  VoteRepository(this._voteDatasourceRepository);

  @override
  Future<VoteEntity> getVote(GetVoteParam param) async {
    return await _voteDatasourceRepository.getVote(param);
  }

  @override
  Future<List<VoteEntity>> getVotes() async {
    return await _voteDatasourceRepository.getVotes();
  }

  @override
  Future<VoteEntity> vote(CreateVoteParam param) async {
    return await _voteDatasourceRepository.vote(param);
  }
}
