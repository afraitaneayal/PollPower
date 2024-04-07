import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/common/error/error_catcher.dart';
import '../../../core/common/error/errors.dart';
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
  Future<Either<AppError, CandidateEntity?>> trigger(
      GetCandidateParam param) async {
    return await ErrorCatcher.tryCatch(
        _candidateRepository.getCandidate(param));
  }
}
