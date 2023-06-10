import 'package:poll_power/core/screens/home/home_screen.dart';
import 'package:poll_power/core/screens/register/register_candidate_screen.dart';
import 'package:poll_power/core/screens/register/register_voter_screen.dart';
import 'package:poll_power/core/screens/splash/splash_screen.dart';
import 'core/app_routes/app_routes.dart';
import 'core/screens/status/status_screen.dart';

class AppRouter {
  static getRoutes() {
    return {
      AppRoutes.splash: (context) => const SplashScreen(),
      AppRoutes.home: (context) => const HomeScreen(),
      AppRoutes.candidate: (context) => const RegisterCandidate(),
      AppRoutes.voter: (context) => const RegisterVoterScreen(),
      AppRoutes.status: (context) => const StatusScreen()
    };
  }
}
