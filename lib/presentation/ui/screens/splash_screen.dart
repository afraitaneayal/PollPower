import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import '../../../core/assets/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(alignment: Alignment.center, children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              "PollPower".bold(
                textAlign: TextAlign.center,
                fontSize: 40.sp,
              ),
              context.gaps.small,
              context.gaps.large,
              Assets.logo.image(),
              context.gaps.large,
            ],
          ),
          Positioned(
            bottom: 20.sp,
            child: "Powered by Ayal & Yaya".light(),
          )
        ]),
      ),
    );
  }
}
