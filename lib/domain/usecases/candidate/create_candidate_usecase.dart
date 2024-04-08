import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/app_error.dart';
import '../../../core/error/error_catcher.dart';
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
  Future<Either<IAppError, CandidateEntity>> trigger(
      CreateCandidateParam param) async {
    return await ErrorCatcher.tryCatch(
        _candidateRepository.createCandidate(param));
  }
}
