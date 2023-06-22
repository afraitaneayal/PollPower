import 'package:flutter/material.dart';
import 'package:poll_power/routes.dart';
import 'package:poll_power/services/user/isar_services.dart';

class Root extends StatelessWidget {
  Root({super.key});

  final isarService = IsarServices();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: AppRouter.getRoutes(),
    );
  }
}
