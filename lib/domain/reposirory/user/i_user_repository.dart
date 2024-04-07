import 'package:dartz/dartz.dart';
import 'package:poll_power/core/common/error/errors.dart';

import '../../entities/user/user.dart';
import '../../objects/jwt_object.dart';
import '../../params/user/create_user_param.dart';
import '../../params/user/get_user_param.dart';
import '../../params/user/log_user_param.dart';

abstract class IUserRepository {
  Future<UserEntity> createUser(CreateUserParam param);

  Future<Either<AppError, JwtObject>> logUser(LogUserParam param);

  Future<UserEntity?> getUser(GetUserParam param);
}
