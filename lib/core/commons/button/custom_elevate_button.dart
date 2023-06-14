import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

import '../../app_colors/app_colors.dart';

class CustomElevateButton {
  Widget getElevateButton({context, route, text, isActive}) {
    if (isActive) {
      return ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(410, 170)),
              backgroundColor: MaterialStateProperty.all(AppColors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)))),
          onPressed: () {
            if (isActive) {
              Navigator.pushNamed(context, "/$route");
            }
          },
          child: "$text".getWidget(
              fontColor: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w600));
    } else {
      return ElevatedButton(
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
