import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_styles.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/theme/buttons/default_buttons.dart';
import 'package:poll_power/core/ui/widgets/default_app_bar.dart';

import '../../../core/assets/assets.gen.dart';

class CandidateScreen extends StatelessWidget {
  const CandidateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Padding(
          padding: AppStyles.defaultScreenPadding.copyWith(bottom: 20.sp),
          child: Stack(children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DefaultAppBar(),
                  context.gaps.large,
                  getArrowButton(callback: () async {}, isLeft: true),
                  context.gaps.large,
                  _buildCandidateInfos(context),
                ],
              ),
            ),
            Positioned(
              bottom: 16.sp,
              left: MediaQuery.of(context).size.width / 6,
              child: _buildVoteButton(context),
            )
          ])),
    );
  }

  Widget _buildCandidateInfos(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 70.sp,
          backgroundImage: AssetImage(Assets.avatar.path),
        ),
        "Yaya Hamed".bold(),
        context.gaps.medium,
        "Vote for healthy study environment".semiBold(),
        context.gaps.medium,
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"
            .light(),
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged"
            .light(),
        context.gaps.large,
      ],
    );
  }

  Widget _buildVoteButton(BuildContext context) {
    return AppTexts.vote.asPrimaryButton(
        callback: () async {},
        padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 71.sp));
  }
}
