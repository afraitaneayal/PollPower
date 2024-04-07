import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/error/error_catcher.dart';
import '../../../core/common/error/errors.dart';
import '../../entities/vote/vote.dart';
import '../../params/vote/create_vote_param.dart';
import '../../reposirory/vote/i_vote_repository.dart';
import '../usecase.dart';

@singleton
class CreateVoteUsecase implements Usecase<CreateVoteParam, VoteEntity> {
  final IVoteRepository _iVoteRepository;

  CreateVoteUsecase(this._iVoteRepository);

  @override
  Future<Either<AppError, VoteEntity>> trigger(CreateVoteParam param) async {
    return await ErrorCatcher.tryCatch(_iVoteRepository.vote(param));
  }
}
