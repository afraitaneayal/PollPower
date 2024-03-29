import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_assets.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/core/screens/admin/admin_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Image.asset(AppAssets.logoSmale, width: 34, height: 34),
        ),
        Flexible(
          child: GestureDetector(
              onLongPress: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminScreen()));
              },
              child: "PollPower".getWidget(
                  fontColor: AppColors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w600)),
        )
      ],
    );
  }
}
