import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/common/error/error_catcher.dart';
import '../../../core/common/error/errors.dart';
import '../../entities/user/user.dart';
import '../../params/user/get_user_param.dart';
import '../../reposirory/user/i_user_repository.dart';
import '../usecase.dart';

@singleton
class GetUserUsecase implements Usecase<GetUserParam, UserEntity> {
  final IUserRepository _userRepository;

  GetUserUsecase(this._userRepository);

  @override
  Future<Either<AppError, UserEntity?>> trigger(GetUserParam param) async {
    return await ErrorCatcher.tryCatch(_userRepository.getUser(param));
  }
}
