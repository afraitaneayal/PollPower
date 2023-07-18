import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_assets.dart';
import 'package:poll_power/core/app_assets/app_constants.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar(
      {super.key, required this.title, required this.content});

  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 55,
      child: _buildElevateButton(context),
    );
  }

  Widget _buildColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        "Registration.".getWidget(fontSize: 24, fontWeight: FontWeight.w600),
        const SizedBox(
          height: 20,
        ),
        AppConstants.lorem.getWidget(fontSize: 18)
      ],
    );
  }

  Widget _buildElevateButton(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.background)),
      child: Image.asset(AppAssets.arrow),
      onPressed: () {
        showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  height: 300,
                  child: _buildColumn());
            });
      },
    );
  }
}
