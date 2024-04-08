import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/app_error.dart';
import '../../../core/error/error_catcher.dart';
import '../../entities/candidate/candidate.dart';
import '../../params/candidate/get_candidate_param.dart';
import '../../reposirory/candidate/i_candidate_repository.dart';
import '../usecase.dart';

@singleton
class GetCandidateUsecase
    implements Usecase<GetCandidateParam, CandidateEntity> {
  final ICandidateRepository _candidateRepository;

  GetCandidateUsecase(this._candidateRepository);

  @override
  Future<Either<IAppError, CandidateEntity?>> trigger(
      GetCandidateParam param) async {
    return await ErrorCatcher.tryCatch(
        _candidateRepository.getCandidate(param));
  }
}
