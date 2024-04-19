import 'package:injectable/injectable.dart';
import 'package:poll_power/data/datasources/i_user_datasource_repository.dart';
import 'package:poll_power/domain/entities/user/user.dart';
import 'package:poll_power/domain/objects/jwt_object.dart';
import 'package:poll_power/domain/params/user/create_user_param.dart';
import 'package:poll_power/domain/params/user/get_user_param.dart';
import 'package:poll_power/domain/params/user/log_user_param.dart';
import 'package:poll_power/domain/reposirory/user/i_user_repository.dart';

@Singleton(as: IUserRepository)
class UserRepositoryImpl implements IUserRepository {
  final IUserDatasource _userDatasource;

  UserRepositoryImpl(this._userDatasource);

  @override
  Future<UserEntity> createUser(CreateUserParam param) async {
    return await _userDatasource.createUser(param);
  }

  @override
  Future<UserEntity?> getUser(GetUserParam param) async {
    return await _userDatasource.getUser(param);
  }

  @override
  Future<JwtObject> logUser(LogUserParam param) async {
    return await _userDatasource.logUser(param);
  }
}
