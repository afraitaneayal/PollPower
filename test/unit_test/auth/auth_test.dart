import 'package:flutter_test/flutter_test.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/domain/params/user/log_user_param.dart';
import 'package:poll_power/domain/usecases/user/log_user_uscase.dart';
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
    _testUserAuthWithInvalidDatas();
  });
}

void _testUserAuthWithInvalidDatas() async {
  test("test user login with invalid datas", () async {
    final LogUserParam param = LogUserParam("aki", "0000");
    final response = await locator.get<LogUserUsecase>().trigger(param);
    expect(response.isLeft(), equals(true));
  });
}
