import '../../entities/user/user.dart';
import '../../objects/jwt_object.dart';
import '../../params/user/create_user_param.dart';
import '../../params/user/get_user_param.dart';
import '../../params/user/log_user_param.dart';

abstract class IUserRepository {
  Future<UserEntity> createUser(CreateUserParam param);

  Future<JwtObject> logUser(LogUserParam param);

  Future<UserEntity> getUser(GetUserParam param);
}
