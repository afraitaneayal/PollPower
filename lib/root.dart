import 'package:flutter/material.dart';
import 'package:poll_power/core/screens/splash/splash_screen.dart';
import 'package:poll_power/services/user/isar_services.dart';

class Root extends StatelessWidget {
  Root({super.key});

  final isarService = IsarServices();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
