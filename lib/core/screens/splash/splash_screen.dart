import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_assets.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(seconds: 3),
    //     () => {Navigator.pushNamed(context, "/login")});

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
