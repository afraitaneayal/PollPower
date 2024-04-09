import 'package:poll_power/domain/entities/user/user.dart';
import 'package:poll_power/domain/objects/jwt_object.dart';
import 'package:poll_power/domain/params/user/create_user_param.dart';
import 'package:poll_power/domain/params/user/get_user_param.dart';
import 'package:poll_power/domain/params/user/log_user_param.dart';

import '../models/transform.dart';

abstract class IUserDatasource with TransformTo {
  Future<UserEntity> createUser(CreateUserParam param);
  Future<UserEntity?> getUser(GetUserParam param);
  Future<JwtObject> logUser(LogUserParam param);
}
