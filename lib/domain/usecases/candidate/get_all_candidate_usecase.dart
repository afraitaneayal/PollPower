import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/app_error.dart';
import '../../../core/error/error_catcher.dart';
import '../../entities/candidate/candidate.dart';
import '../../reposirory/candidate/i_candidate_repository.dart';
import '../usecase.dart';

@singleton
class GetAllCandidateUsecase implements Usecase<void, List<CandidateEntity>> {
  final ICandidateRepository _candidateRepository;

  GetAllCandidateUsecase(this._candidateRepository);

  @override
  Future<Either<IAppError, List<CandidateEntity>>> trigger(
      dynamic param) async {
    return await ErrorCatcher.tryCatch(_candidateRepository.getAllCandidate());
  }
}
