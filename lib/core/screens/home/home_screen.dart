import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: const Scaffold(
          body: Placeholder(),
        ),
        onWillPop: () async {
          return false;
        });
  }
}
