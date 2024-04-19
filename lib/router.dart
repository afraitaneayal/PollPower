import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poll_power/presentation/ui/screens/account_type_screen.dart';
import 'package:poll_power/presentation/ui/screens/candidate_screen.dart';
import 'package:poll_power/presentation/ui/screens/home_screen.dart';
import 'package:poll_power/presentation/ui/screens/login_screen.dart';
import 'package:poll_power/presentation/ui/screens/register_screen.dart';
import 'package:poll_power/presentation/ui/screens/splash_screen.dart';
import 'core/common/app_route.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter _router = GoRouter(
      navigatorKey: navKey,
      initialLocation: AppRoutes.splash,
      routes: <RouteBase>[
        GoRoute(
          path: AppRoutes.splash,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppRoutes.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppRoutes.accountType,
          builder: (context, state) => const AccountTypeScreen(),
        ),
        GoRoute(
          path: AppRoutes.registerVoter,
          builder: (context, state) => const RegisterScreen(
            isVoter: true,
          ),
        ),
        GoRoute(
          path: AppRoutes.registerCandidate,
          builder: (context, state) => const RegisterScreen(
            isVoter: false,
          ),
        ),
        GoRoute(
          path: AppRoutes.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoutes.candidate,
          builder: (context, state) => const CandidateScreen(),
        ),
      ],
      debugLogDiagnostics: true);

  GoRouter get router => _router;
}
