import 'package:poll_power/domain/entities/candidate/candidate.dart';
import 'package:poll_power/domain/params/candidate/create_candidate_param.dart';
import 'package:poll_power/domain/params/candidate/get_candidate_param.dart';
import 'package:poll_power/domain/params/candidate/vote_candidate_param.dart';

import '../models/transform.dart';

abstract class ICandidateDatasourceRepository with TransformTo {
  Future<CandidateEntity> createCandidate(CreateCandidateParam param);
  Future<List<CandidateEntity>> getCandidates();
  Future<void> voteCandidate(VoteCandidateParam param);
  Future<CandidateEntity?> getCandidate(GetCandidateParam param);
}
