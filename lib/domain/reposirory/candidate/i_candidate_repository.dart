import 'package:poll_power/domain/params/candidate/vote_candidate_param.dart';

import '../../entities/candidate/candidate.dart';
import '../../params/candidate/create_candidate_param.dart';
import '../../params/candidate/get_candidate_param.dart';

abstract class ICandidateRepository {
  Future<CandidateEntity> createCandidate(CreateCandidateParam param);
  Future<void> voteCandidate(VoteCandidateParam param);
  Future<CandidateEntity?> getCandidate(GetCandidateParam param);
  Future<List<CandidateEntity>> getAllCandidate();
}
