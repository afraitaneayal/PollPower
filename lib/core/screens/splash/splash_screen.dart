import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/widget/splash_widget.dart';
import 'package:poll_power/core/screens/status/status_screen.dart';
import 'package:poll_power/services/user/isar_services.dart';
import '../../../services/firebase/firebase_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      verofyUser(context);
    });

    return Container(
      color: AppColors.white,
      child: const SplashWidget(),
    );
  }

  verofyUser(context) async {
    final isar = await IsarServices().getUser();
    final startStatus = await FirebaseService().getStartStatus();
    if (isar == null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => StatusScreen(status: startStatus)));
    } else {
      Navigator.pushNamed(context, "/home");
    }
  }
}
