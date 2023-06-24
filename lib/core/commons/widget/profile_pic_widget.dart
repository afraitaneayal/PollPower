import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'dart:math' as math;

class ProfilPic extends StatelessWidget {
  const ProfilPic({super.key, required this.firstLetter});

  final String firstLetter;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.getScreenWidth() / 10,
      backgroundColor: randomColors(),
      child: firstLetter.getWidget(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          fontColor: AppColors.white),
    );
  }

  Color randomColors() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}
