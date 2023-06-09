import 'package:poll_power/core/screens/login/login_screen.dart';
import 'package:poll_power/core/screens/register/register_user_screen.dart';
import 'package:poll_power/core/screens/splash/splash_screen.dart';

import 'core/app_routes/app_routes.dart';

class AppRouter {
  static getRoutes() {
    return {
      AppRoutes.splash: (context) => const SplashScreen(),
      AppRoutes.login: (context) => const LoginScreen(),
      AppRoutes.register: (context) => const RegisterScreen()
    };
  }
}
