import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/error/app_error.dart';
import '../../../core/error/error_catcher.dart';
import '../../objects/jwt_object.dart';
import '../../params/user/log_user_param.dart';
import '../../reposirory/user/i_user_repository.dart';
import '../usecase.dart';

@singleton
class LogUserUsecase implements Usecase<LogUserParam, JwtObject> {
  final IUserRepository _userRepository;
  LogUserUsecase(this._userRepository);

  @override
  Future<Either<IAppError, JwtObject>> trigger(LogUserParam param) async {
    final result = await ErrorCatcher.tryCatch(_userRepository.logUser(param));
    return await result.fold((l) => left(l), (r) async {
      return right(r);
    });
  }
}
