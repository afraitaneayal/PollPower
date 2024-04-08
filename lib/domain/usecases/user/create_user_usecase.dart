import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../core/error/app_error.dart';
import '../../../core/error/error_catcher.dart';
import '../../entities/user/user.dart';
import '../../params/user/create_user_param.dart';
import '../../reposirory/user/i_user_repository.dart';
import '../usecase.dart';

@singleton
class CreateUserUsecase implements Usecase<CreateUserParam, UserEntity> {
  final IUserRepository _userRepository;

  CreateUserUsecase(this._userRepository);

  @override
  Future<Either<IAppError, UserEntity>> trigger(CreateUserParam param) async {
    final user = await ErrorCatcher.tryCatch(_userRepository.createUser(param));
    return user;
  }
}
