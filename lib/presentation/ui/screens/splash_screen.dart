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
      (timeStamp) async {
        final bool isReady =
            await locator.get<AuthBloc>().isUserAuthenticated();
        if (isReady) {
          locator.get<CandidateBloc>().add(GetCandidatesEvent());
          // ignore: use_build_context_synchronously
          context.push(AppRoutes.home);
        } else {
          // ignore: use_build_context_synchronously
          context.push(AppRoutes.login);
        }
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
