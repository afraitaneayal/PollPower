import 'package:flutter_test/flutter_test.dart';
import 'package:poll_power/core/error/app_error.dart';
import 'package:poll_power/data/communication/rest/i_rest_api.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/domain/entities/user/user.dart';
import 'package:poll_power/domain/objects/jwt_object.dart';
import 'package:poll_power/domain/params/user/create_user_param.dart';
import 'package:poll_power/domain/params/user/log_user_param.dart';
import 'package:poll_power/domain/usecases/user/create_user_usecase.dart';
import 'package:poll_power/domain/usecases/user/log_user_uscase.dart';
import 'package:poll_power_openapi/poll_power_openapi.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initTest() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final mockValue = <String, Object>{};
  SharedPreferences.setMockInitialValues(mockValue);
  await setupDependencies();
}

Future<void> main() async {
  await initTest();

  setUpAll(() async => null);
  tearDown(() => null);
  group("authentication test group", () {
    _testUserLoginWithInvalidDatasWithoudInternetAccess();
    _testUserLoginWithInvalidDatas();
    _testUserLoginWithEmptyDatas();
    _testUserLogin();
    _testUserSignUpWithInvalidData();
    _testUserSignUp();
  });
}

void _testUserLoginWithInvalidDatas() async {
  test("test user login with invalid datas", () async {
    final LogUserParam param = LogUserParam("aki", "0000");
    final response = await locator.get<LogUserUsecase>().trigger(param);
    final leftR = response.fold((l) => l, (r) => null);
    expect(leftR is NoInternetError, equals(true));
  });
}

void _testUserLogin() async {
  test("test user login with", () async {
    final LogUserParam param = LogUserParam("yayahc@gmail.com", "2432");
    final response = await locator.get<LogUserUsecase>().trigger(param);
    final rightR = response.fold((l) => null, (r) => r);
    expect(rightR is JwtObject, equals(false));
  });
}

void _testUserSignUpWithInvalidData() async {
  test("test user signup with invalid datas", () async {
    final CreateUserParam param = CreateUserParam("", "", "", "", "", "", "");
    final response = await locator.get<CreateUserUsecase>().trigger(param);
    final leftR = response.fold((l) => l, (r) => null);
    expect(leftR is BadRequestError, equals(false));
  });
}

void _testUserSignUp() async {
  test("test user signup", () async {
    final CreateUserParam param = CreateUserParam(
        "aki@gmail.com", "MI", "M2", "", "iko", "aki", "akiiko");
    final response = await locator.get<CreateUserUsecase>().trigger(param);
    final rightR = response.fold((l) => null, (r) => r);
    expect(rightR is UserEntity, equals(false));
  });
}

void _testUserLoginWithEmptyDatas() async {
  test("test user login with empty datas", () async {
    final LogUserParam param = LogUserParam("", "");
    final response = await locator.get<LogUserUsecase>().trigger(param);
    final leftR = response.fold((l) => l, (r) => null);
    expect(leftR is NoInternetError, equals(true));
  });
}

void _testUserLoginWithInvalidDatasWithoudInternetAccess() async {
  test("test user login with no internet access", () async {
    final LogUserParam param = LogUserParam("aki", "0000");
    final response = await locator.get<LogUserUsecase>().trigger(param);
    final leftR = response.fold((l) => l, (r) => null);
    expect(leftR is NoInternetError, equals(true));
  });
}
