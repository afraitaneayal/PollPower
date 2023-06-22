import 'core/app_routes/app_routes.dart';
import 'core/screens/register/register_candidate_screen.dart';
import 'core/screens/register/register_voter_screen.dart';
import 'core/screens/splash/splash_screen.dart';

class AppRouter {
  static getRoutes() {
    return {
      AppRoutes.splash: (context) => const SplashScreen(),
      AppRoutes.candidate: (context) => const RegisterCandidate(),
      AppRoutes.voter: (context) => const RegisterVoterScreen(),
    };
  }
}
