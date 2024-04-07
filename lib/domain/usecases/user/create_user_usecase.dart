import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:poll_power/core/common/error/errors.dart';
import '../../../core/common/error/error_catcher.dart';
import '../../entities/user/user.dart';
import '../../params/user/create_user_param.dart';
import '../../reposirory/user/i_user_repository.dart';
import '../usecase.dart';

@singleton
class CreateUserUsecase implements Usecase<CreateUserParam, UserEntity> {
  final IUserRepository _userRepository;

  CreateUserUsecase(this._userRepository);

  @override
  Future<Either<AppError, UserEntity>> trigger(CreateUserParam param) async {
    final user = await ErrorCatcher.tryCatch(_userRepository.createUser(param));
    return user;
  }
}
