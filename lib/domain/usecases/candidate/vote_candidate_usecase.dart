import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:poll_power/core/error/app_error.dart';
import 'package:poll_power/core/error/error_catcher.dart';
import 'package:poll_power/domain/params/candidate/vote_candidate_param.dart';
import 'package:poll_power/domain/reposirory/candidate/i_candidate_repository.dart';
import 'package:poll_power/domain/usecases/usecase.dart';

@singleton
class VoteCandidateUsecase implements Usecase<VoteCandidateParam, void> {
  final ICandidateRepository _candidateRepository;

  VoteCandidateUsecase(this._candidateRepository);

  @override
  Future<Either<IAppError, void>> trigger(VoteCandidateParam param) async {
    return await ErrorCatcher.tryCatch(
        _candidateRepository.voteCandidate(param));
  }
}
