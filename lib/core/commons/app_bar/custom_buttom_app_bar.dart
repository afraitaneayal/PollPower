import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_assets.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 55,
      child: Image.asset(AppAssets.arrow),
    );
  }
}
