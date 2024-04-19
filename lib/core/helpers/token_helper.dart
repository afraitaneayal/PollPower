import 'package:injectable/injectable.dart';
import 'package:poll_power/domain/objects/jwt_object.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class TokenHelper {
  final SharedPreferences _pref;
  TokenHelper(@Named('pref') this._pref);

  String? getAccesToken() {
    final token = _pref.getString('acces');
    return token;
  }

  String? getRefreshToken() {
    final token = _pref.getString('refresh');
    return token;
  }

  void saveTokens(JwtObject tokens) {
    final String accesToken = tokens.token;
    final String refreshToken = tokens.refresh_token;
    _pref.setString('acces', accesToken);
    _pref.setString('refresh', refreshToken);
  }

  Future<void> removeCredentials() async {
    await _pref.remove('acces');
    await _pref.remove('refresh');
  }

  bool isAuthenticated() {
    final token = getAccesToken();
    return token != null;
  }
}
