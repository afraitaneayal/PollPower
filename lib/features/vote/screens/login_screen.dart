import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_styles.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/widgets/default_app_bar.dart';
import 'package:poll_power/features/vote/forms/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Container(
        padding: AppStyles.defaultScreenPadding,
        child: Column(
          children: [
            const DefaultAppBar(),
            context.gaps.small,
            context.gaps.large,
            context.gaps.large,
            const LoginForm(),
            context.gaps.large,
            context.gaps.medium,
            context.gaps.large,
            AppTexts.dontHaveAccount.light(),
            context.gaps.medium,
            AppTexts.caalToRegister.asSecondaryButton(callback: () async {})
          ],
        ),
      ),
    );
  }
}
