import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/error/error_catcher.dart';
import '../../../core/common/error/errors.dart';
import '../../entities/vote/vote.dart';
import '../../params/vote/get_vote_param.dart';
import '../../reposirory/vote/i_vote_repository.dart';
import '../usecase.dart';

@singleton
class GetVotesUsecase implements Usecase<GetVoteParam, VoteEntity> {
  final IVoteRepository _iVoteRepository;

  GetVotesUsecase(this._iVoteRepository);

  @override
  Future<Either<AppError, VoteEntity?>> trigger(GetVoteParam param) async {
    return await ErrorCatcher.tryCatch(_iVoteRepository.getVote(param));
  }
}
