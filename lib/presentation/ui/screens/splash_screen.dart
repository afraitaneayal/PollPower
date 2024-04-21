import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:poll_power/core/common/app_route.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/presentation/state_management/bloc/auth/auth_bloc.dart';
import 'package:poll_power/presentation/state_management/bloc/candidate/candidate_bloc.dart';
import 'package:poll_power/presentation/state_management/bloc/candidate/candidate_event.dart';
import '../../../core/assets/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Future.delayed(
          const Duration(seconds: 2),
          () => context.go(AppRoutes.home),
        );
      },
    );

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
              context.gaps.large,
              context.gaps.large,
              CircularProgressIndicator(
                color: context.colors.black,
              )
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
