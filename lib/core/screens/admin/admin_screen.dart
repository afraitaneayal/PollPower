import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
          onPressed: () {},
          child: "Turn On".getWidget(
              fontColor: AppColors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.w600)),
    );
  }
}
