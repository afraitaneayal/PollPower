import '../../entities/candidate/candidate.dart';
import '../../params/candidate/create_candidate_param.dart';
import '../../params/candidate/get_candidate_param.dart';

abstract class ICandidateRepository {
  Future<CandidateEntity> createCandidate(CreateCandidateParam param);

  Future<CandidateEntity?> getCandidate(GetCandidateParam param);
  Future<List<CandidateEntity>> getAllCandidate();
}
