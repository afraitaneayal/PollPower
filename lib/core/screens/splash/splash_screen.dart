import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/widget/splash_widget.dart';
import 'package:poll_power/core/screens/home/home_screen.dart';
import 'package:poll_power/core/screens/status/status_screen.dart';
import 'package:poll_power/services/user/isar_services.dart';
import '../../../services/firebase/firebase_service.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    verifyUser(context);

    return Container(
      color: AppColors.white,
      child: const SplashWidget(),
    );
  }

  void verifyUser(context) async {
    final isarUser = await IsarServices().getUser();
    final isarCandidate = await IsarServices().getCandidate();
    final startStatus = await FirebaseService().getStartStatus();
    final candidateData = FirebaseService().getCandidates();
    final userCount = await FirebaseService().getUserCount();
    final device = await IsarServices().getDeviceState();

    switch (isarUser) {
      case null:
        if (isarCandidate == null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StatusScreen(
                        deviceState: device,
                        status: startStatus,
                        candidateData: candidateData,
                        userCount: userCount,
                      )));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        deviceState: device,
                        user: isarCandidate,
                        candidateData: candidateData,
                        userCount: userCount,
                      )));
        }
        break;
      default:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomeScreen(
                      deviceState: device,
                      user: isarUser,
                      candidateData: candidateData,
                      userCount: userCount,
                    )));
    }
  }
}
