import 'package:injectable/injectable.dart';
import 'package:poll_power/data/datasources/i_user_datasource_repository.dart';
import 'package:poll_power/domain/entities/user/user.dart';
import 'package:poll_power/domain/objects/jwt_object.dart';
import 'package:poll_power/domain/params/user/create_user_param.dart';
import 'package:poll_power/domain/params/user/get_user_param.dart';
import 'package:poll_power/domain/params/user/log_user_param.dart';

@Singleton(as: IUserDatasource)
class RemoteUserDatasourceWithRestImpl implements IUserDatasource {
  @override
  Future<UserEntity> createUser(CreateUserParam param) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> getUser(GetUserParam param) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<JwtObject> logUser(LogUserParam param) {
    // TODO: implement logUser
    throw UnimplementedError();
  }

  @override
  transform(param) {
    // TODO: implement transform
    throw UnimplementedError();
  }
}
