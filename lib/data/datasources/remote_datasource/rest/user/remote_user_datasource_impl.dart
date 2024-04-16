import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:poll_power/core/error/app_error.dart';
import 'package:poll_power/data/communication/rest/i_rest_api.dart';
import 'package:poll_power/data/datasources/i_user_datasource_repository.dart';
import 'package:poll_power/domain/entities/user/user.dart';
import 'package:poll_power/domain/objects/jwt_object.dart';
import 'package:poll_power/domain/params/user/create_user_param.dart';
import 'package:poll_power/domain/params/user/get_user_param.dart';
import 'package:poll_power/domain/params/user/log_user_param.dart';
import 'package:poll_power_openapi/poll_power_openapi.dart';

@Singleton(as: IUserDatasource)
class RemoteUserDatasourceWithRestImpl implements IUserDatasource {
  final IRestAPI _api;
  RemoteUserDatasourceWithRestImpl(this._api);

  @override
  Future<UserEntity> createUser(CreateUserParam param) async {
    final User body = User(
        email: param.email,
        password: param.password,
        firstName: param.firstName,
        lastName: param.lastName,
        grade: param.grade,
        areaOfStudy: param.areaOfStudy);
    final SignUpUserResponse response = await _api.signUpUser(body);
    if (response.status == HttpStatus.created) {
      final SignUpUserResponse201 e = response as SignUpUserResponse201;
      return transform(User.fromJson(e.body.toJson()));
    } else if (response.status == HttpStatus.badRequest) {
      final SignUpUserResponse400 e = response as SignUpUserResponse400;
      throw GenericAppError(e.body.error!.userFriendlyMessage.toString());
    }
    throw InternlaServerError();
  }

  @override
  Future<UserEntity> getUser(GetUserParam param) {
    throw UnimplementedError();
  }

  @override
  Future<JwtObject> logUser(LogUserParam param) async {
    final UserLoginRequest request =
        UserLoginRequest(email: param.email, password: param.password);
    final LoginUserResponse response = await _api.loginUser(request);
    if (response.status == HttpStatus.ok) {
      final LoginUserResponse200 e = response as LoginUserResponse200;
      return JwtObject.fromJson(e.body.toJson());
    } else if (response.status == HttpStatus.badRequest) {
      final LoginUserResponse400 e = response as LoginUserResponse400;
      throw GenericAppError(e.body.error!.userFriendlyMessage.toString());
    }
    throw InternlaServerError();
  }

  @override
  UserEntity transform(param) {
    final User p = param as User;
    return UserEntity(
        uuid: null,
        email: p.email,
        password: p.password,
        first_name: p.firstName,
        last_name: p.lastName,
        grade: p.grade,
        area_of_study: p.areaOfStudy,
        image: p.image);
  }
}
