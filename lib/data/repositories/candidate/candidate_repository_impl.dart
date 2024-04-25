import 'package:injectable/injectable.dart';
import 'package:poll_power/data/datasources/i_candidate_datasource_repository.dart';
import 'package:poll_power/domain/entities/candidate/candidate.dart';
import 'package:poll_power/domain/params/candidate/create_candidate_param.dart';
import 'package:poll_power/domain/params/candidate/get_candidate_param.dart';
import 'package:poll_power/domain/params/candidate/vote_candidate_param.dart';
import 'package:poll_power/domain/reposirory/candidate/i_candidate_repository.dart';

@Singleton(as: ICandidateRepository)
class CandidateRepositoryImpl implements ICandidateRepository {
  final ICandidateDatasourceRepository _candidateDatasourceRepository;

  CandidateRepositoryImpl(this._candidateDatasourceRepository);

  @override
  Future<CandidateEntity> createCandidate(CreateCandidateParam param) async {
    return await _candidateDatasourceRepository.createCandidate(param);
  }

  @override
  Future<List<CandidateEntity>> getAllCandidate() async {
    return await _candidateDatasourceRepository.getCandidates();
  }

  @override
  Future<CandidateEntity?> getCandidate(GetCandidateParam param) async {
    return await _candidateDatasourceRepository.getCandidate(param);
  }

  @override
  Future<void> voteCandidate(VoteCandidateParam param) async {
    return await _candidateDatasourceRepository.voteCandidate(param);
  }
}
