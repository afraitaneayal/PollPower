import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/common/error/error_catcher.dart';
import '../../../core/common/error/errors.dart';
import '../../entities/candidate/candidate.dart';
import '../../params/candidate/create_candidate_param.dart';
import '../../reposirory/candidate/i_candidate_repository.dart';
import '../usecase.dart';

@singleton
class CreateCandidateUsecase
    implements Usecase<CreateCandidateParam, CandidateEntity> {
  final ICandidateRepository _candidateRepository;

  CreateCandidateUsecase(this._candidateRepository);

  @override
  Future<Either<AppError, CandidateEntity>> trigger(
      CreateCandidateParam param) async {
    return await ErrorCatcher.tryCatch(
        _candidateRepository.createCandidate(param));
  }
}
