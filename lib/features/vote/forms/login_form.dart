import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/widgets/default_text_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.login.bold(fontSize: 36.sp),
        context.gaps.large,
        _buildForm(context),
        context.gaps.small,
        _buildLoginButton()
      ],
    );
  }

  Center _buildLoginButton() {
    return Center(
      child: AppTexts.login.asPrimaryButton(
          callback: () async {},
          padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 71.sp)),
    );
  }

  Form _buildForm(BuildContext context) => Form(
      key: _formKey,
      child: Column(
        children: [
          DefaultTextInput(
            textEditingController: _emailController,
            hintText: AppTexts.emailRequirement,
            onTap: null,
          ),
          context.gaps.medium,
          context.gaps.small,
          DefaultTextInput(
            textEditingController: _passwordController,
            isObscure: true,
            hintText: AppTexts.passwordRequirement,
            onTap: null,
          ),
          context.gaps.large,
        ],
      ));
}
