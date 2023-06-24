import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import '../../app_colors/app_colors.dart';

class CustomButton {
  Widget getCustomButton({context, route, text, isActive}) {
    if (isActive) {
      return TextButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(410, 170)),
              backgroundColor: MaterialStateProperty.all(AppColors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)))),
          onPressed:
              !isActive ? null : () => Navigator.pushNamed(context, "/$route"),
          child: "$text".getWidget(
              fontColor: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w600));
    } else {
      return TextButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(300, 150)),
              backgroundColor: MaterialStateProperty.all(Colors.black12),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)))),
          onPressed: () {},
          child: "$text".getWidget(
              fontColor: Colors.black12,
              fontSize: 34,
              fontWeight: FontWeight.w600));
    }
  }
}
