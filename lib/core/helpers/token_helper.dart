import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class TokenHelper {
  final SharedPreferences _pref;
  TokenHelper(@Named('pref') this._pref);

  String? getToken() {
    final token = _pref.getString('token');
    return token;
  }

  bool isAuthenticated() {
    final token = getToken();
    return token != null;
  }
}
