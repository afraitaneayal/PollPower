import 'package:injectable/injectable.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/domain/objects/jwt_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class AppKeyHelper {
  String getAppKey() {
    return "oazpddugzie";
  }
}
