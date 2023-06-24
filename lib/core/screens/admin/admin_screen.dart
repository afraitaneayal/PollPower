import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';

import '../../app_colors/app_colors.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({super.key});

  final service = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: service.getStartStatusWithStream(),
        initialData: false,
        builder: (context, stream) {
          final streamData = stream.data!;
          return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: context.getScreenWidth() / 10),
              color: AppColors.white,
              alignment: Alignment.center,
              child: _buildElevateButton(streamData));
        });
  }

  Widget _buildButtonText({String? buttonText}) {
    return buttonText!.getWidget(
        fontColor: AppColors.white,
        fontSize: 54.0,
        fontWeight: FontWeight.w600);
  }

  Widget _buildElevateButton(streamData) {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(const Size(410, 170)),
          backgroundColor: MaterialStateProperty.all(AppColors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)))),
      onPressed: () {
        service.changeStartStatus(streamData);
      },
      child: streamData
          ? _buildButtonText(buttonText: "Off")
          : _buildButtonText(buttonText: "On"),
    );
  }
}
