import 'package:flutter/material.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

import '../../app_assets/app_assets.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(),
        Column(
          children: [
            "PollPower".getWidget(fontSize: 40, fontWeight: FontWeight.w700),
            const SizedBox(
              height: 80,
            ),
            Image.asset(AppAssets.logo),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 25),
          child: "Powered by Ayal & YayaHc".getWidget(fontSize: 12),
        ),
      ],
    );
  }
}
