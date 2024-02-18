import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_styles.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/theme/buttons/default_buttons.dart';
import 'package:poll_power/core/ui/widgets/default_app_bar.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Container(
        padding: AppStyles.defaultScreenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DefaultAppBar(),
            context.gaps.large,
            context.gaps.large,
            AppTexts.accountTypeSelection.semiBold(fontSize: 32.sp),
            context.gaps.medium,
            _buildButtons(context),
            context.gaps.large,
            context.gaps.large,
            getArrowButton(
              isLeft: true,
              callback: () async {},
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTexts.candidate.asPrimaryButton(
          padding: EdgeInsets.symmetric(vertical: 52.sp, horizontal: 100.sp),
          callback: () async {},
        ),
        context.gaps.small,
        AppTexts.voter.asPrimaryButton(
          padding: EdgeInsets.symmetric(vertical: 52.sp, horizontal: 120.sp),
          callback: () async {},
        ),
      ],
    );
  }
}
