import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poll_power/features/vote/screens/account_type_screen.dart';
import 'package:poll_power/features/vote/screens/candidate_screen.dart';
import 'package:poll_power/features/vote/screens/home_screen.dart';
import 'package:poll_power/features/vote/screens/login_screen.dart';
import 'package:poll_power/features/vote/screens/register_screen.dart';
import 'package:poll_power/features/vote/screens/splash_screen.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter _router = GoRouter(
      initialLocation: AppRoute.home,
      routes: <RouteBase>[
        GoRoute(
          path: AppRoute.splash,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen(),
        ),
        GoRoute(
          path: AppRoute.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppRoute.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppRoute.accountType,
          builder: (context, state) => const AccountTypeScreen(),
        ),
        GoRoute(
          path: AppRoute.register,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: AppRoute.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: AppRoute.candidate,
          builder: (context, state) => const CandidateScreen(),
        ),
      ],
      debugLogDiagnostics: true);

  GoRouter get router => _router;
}

class AppRoute {
  static String splash = "/splash";
  static String login = "/login";
  static String register = "/register";
  static String accountType = "/accountType";
  static String home = "/";
  static String candidate = "/condidate";
}
