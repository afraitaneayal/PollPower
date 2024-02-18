import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poll_power/features/vote/screens/account_type_screen.dart';
import 'package:poll_power/features/vote/screens/login_screen.dart';
import 'package:poll_power/features/vote/screens/splash_screen.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class AppRouter {
  final GoRouter _router = GoRouter(
      initialLocation: AppRoute.accountType,
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
        )
      ],
      debugLogDiagnostics: true);

  GoRouter get router => _router;
}

class AppRoute {
  static String splash = "/splash";
  static String login = "/login";
  static String register = "/register";
  static String registerStepOne = "/$register/stepOne";
  static String registerStepTwo = "/$register/stepTwo";
  static String registerStepThree = "/$register/stepThree";
  static String accountType = "/accountType";
  static String home = "/";
  static String condidate = "/condidate/:candidateId";
}
