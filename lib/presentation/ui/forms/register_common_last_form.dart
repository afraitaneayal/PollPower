import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/widgets/default_text_input.dart';

class RegisterCommonLastForm extends StatefulWidget {
  final String accountType;
  const RegisterCommonLastForm({super.key, required this.accountType});

  @override
  State<RegisterCommonLastForm> createState() => _RegisterLastFCommonormState();
}

class _RegisterLastFCommonormState extends State<RegisterCommonLastForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in [
      _emailController,
      _passwordController,
      _confirmPasswordController
    ]) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        context.gaps.large,
        context.gaps.large,
        widget.accountType.bold(fontSize: 36.sp),
        context.gaps.large,
        _buildForm(context),
        context.gaps.small,
      ],
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
          context.gaps.large,
          DefaultTextInput(
            textEditingController: _passwordController,
            isObscure: true,
            hintText: AppTexts.passwordRequirement,
            onTap: null,
          ),
          context.gaps.large,
          DefaultTextInput(
            textEditingController: _confirmPasswordController,
            isObscure: true,
            hintText: AppTexts.confirmPasswordRequirement,
            onTap: null,
          ),
          context.gaps.large,
          AppTexts.register.asPrimaryButton(
              padding: EdgeInsets.symmetric(vertical: 16.sp, horizontal: 71.sp),
              callback: () async {})
        ],
      ));
}
