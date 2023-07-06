import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class ProfilPic extends StatelessWidget {
  const ProfilPic({super.key, required this.firstLetter});

  final String firstLetter;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.getScreenWidth() / 10,
      backgroundColor: const Color.fromARGB(200, 255, 23, 7),
      child: firstLetter.getWidget(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          fontColor: AppColors.white),
    );
  }
}
