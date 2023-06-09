import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_assets.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/services/user/isar_services.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      final isarService = IsarServices();
      final curentUserStatus = isarService.getUserStatus();
      print(curentUserStatus);
      // if (uStatus == "True") {
      //   Navigator.pushNamed(context, "/login");
      // } else {
      //   Future.delayed(const Duration(seconds: 3),
      //       () => {Navigator.pushNamed(context, "/register")});
      // }
    } catch (e) {
      debugPrint("Something Wrong");
    }

    return Container(
      color: AppColors.white,
      child: _buildColumn(),
    );
  }

  Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Column(
          children: [
            "PollPower".getWidget(fontSize: 40, fontWeight: FontWeight.w700),
            const SizedBox(
              height: 80,
            ),
            Image.asset(AppAssets.logo),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 25),
          child: "Powered by Ayal & YayaHc".getWidget(fontSize: 12),
        ),
      ],
    );
  }
}
