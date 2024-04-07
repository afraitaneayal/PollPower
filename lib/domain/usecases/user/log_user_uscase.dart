import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../core/common/error/error_catcher.dart';
import '../../../core/common/error/errors.dart';
import '../../objects/jwt_object.dart';
import '../../params/user/log_user_param.dart';
import '../../reposirory/user/i_user_repository.dart';
import '../usecase.dart';

@singleton
class LogUserUsecase implements Usecase<LogUserParam, JwtObject> {
  final IUserRepository _userRepository;
  LogUserUsecase(this._userRepository);

  @override
  Future<Either<AppError, JwtObject>> trigger(LogUserParam param) async {
    final result = await ErrorCatcher.tryCatch(_userRepository.logUser(param));
    return await result.fold((l) => left(l), (r) async {
      return await r.fold((l) => left(l), (r) {
        return right(r);
      });
    });
  }
}
