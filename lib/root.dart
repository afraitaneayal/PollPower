import 'package:flutter/material.dart';
import 'package:poll_power/routes.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: AppRouter.getRoutes(),
    );
  }
}
