import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poll_power/core/common/app_styles.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/ui/theme/buttons/default_buttons.dart';
import 'package:poll_power/core/ui/widgets/default_app_bar.dart';
import 'package:poll_power/features/vote/forms/register_candidate_first_form.dart';
import 'package:poll_power/features/vote/forms/register_voter_first_form.dart';
import 'package:poll_power/features/vote/forms/register_voter_second_form.dart';

import '../forms/register_candidate_second_form.dart';
import '../forms/register_common_last_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Padding(
        padding: AppStyles.defaultScreenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const DefaultAppBar(),
            // const RegisterVoterFirstForm(),
            const RegisterCommonLastForm(accountType: AppTexts.voter),
            context.gaps.small,
            _buildArrowButtons(context),
          ],
        ),
      ),
    );
  }

  Row _buildArrowButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        getArrowButton(
          isLeft: true,
          callback: () async {},
        ),
        getArrowButton(isLeft: false, callback: () async {})
      ],
    );
  }
}
