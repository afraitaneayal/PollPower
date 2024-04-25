import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:poll_power/core/common/app_styles.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/theme/buttons/default_buttons.dart';
import 'package:poll_power/core/ui/widgets/default_app_bar.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/domain/entities/candidate/candidate.dart';
import 'package:poll_power/presentation/state_management/bloc/candidate/candidate_bloc.dart';
import 'package:poll_power/presentation/state_management/bloc/candidate/candidate_event.dart';

import '../../../core/assets/assets.gen.dart';

class CandidateScreen extends StatelessWidget {
  final CandidateEntity candidate;
  const CandidateScreen({super.key, required this.candidate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Padding(
          padding: AppStyles.defaultScreenPadding.copyWith(bottom: 20.sp),
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const DefaultAppBar(),
                  context.gaps.large,
                  context.gaps.large,
                  _buildCandidateInfos(context),
                  _buildVoteButton(context, candidate.uuid)
                ],
              ),
            ),
            Positioned(
              top: 70.sp,
              left: 0,
              child: getArrowButton(
                  callback: () async => context.pop(), isLeft: true),
            )
          ])),
    );
  }

  Widget _buildCandidateInfos(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 70.sp,
          backgroundImage: AssetImage(Assets.avatar.path),
        ),
        context.gaps.medium,
        "${candidate.user.first_name} ${candidate.user.last_name}"
            .bold(fontSize: 18.sp),
        context.gaps.small,
        candidate.slogan.semiBold(),
        context.gaps.small,
        candidate.speech.light(),
        context.gaps.large,
      ],
    );
  }

  Widget _buildVoteButton(BuildContext contex, String? candidateUuid) {
    return AppTexts.vote.asPrimaryButton(
        callback: () async {
          candidateUuid != null
              ? locator
                  .get<CandidateBloc>()
                  .add(VoteCandidateEvent(candidateUuid))
              : null;
        },
        padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 71.sp));
  }
}
