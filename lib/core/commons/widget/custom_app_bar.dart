import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_assets.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          child: Image.asset(AppAssets.logoSmale, width: 40, height: 40),
          onLongPress: () => Navigator.pushNamed(context, '/admin'),
        ),
        "PollPower".getWidget(
            fontColor: AppColors.black,
            fontSize: 34,
            fontWeight: FontWeight.w600)
      ],
    );
  }
}
