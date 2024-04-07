import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/error/error_catcher.dart';
import '../../../core/common/error/errors.dart';
import '../../entities/candidate/candidate.dart';
import '../../reposirory/candidate/i_candidate_repository.dart';
import '../usecase.dart';

@singleton
class GetAllCandidateUsecase implements Usecase<void, List<CandidateEntity>> {
  final ICandidateRepository _candidateRepository;

  GetAllCandidateUsecase(this._candidateRepository);

  @override
  Future<Either<AppError, List<CandidateEntity>?>> trigger(void param) async {
    return await ErrorCatcher.tryCatch(_candidateRepository.getAllCandidate());
  }
}
