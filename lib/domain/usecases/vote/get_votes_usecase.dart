import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/app_error.dart';
import '../../../core/error/error_catcher.dart';
import '../../entities/vote/vote.dart';
import '../../params/vote/get_vote_param.dart';
import '../../reposirory/vote/i_vote_repository.dart';
import '../usecase.dart';

@singleton
class GetVotesUsecase implements Usecase<GetVoteParam, VoteEntity> {
  final IVoteRepository _iVoteRepository;

  GetVotesUsecase(this._iVoteRepository);

  @override
  Future<Either<IAppError, VoteEntity?>> trigger(GetVoteParam param) async {
    return await ErrorCatcher.tryCatch(_iVoteRepository.getVote(param));
  }
}
