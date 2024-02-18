import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/widgets/default_text_input.dart';

import '../../../core/assets/assets.gen.dart';

class RegisterCandidateSecondForm extends StatefulWidget {
  const RegisterCandidateSecondForm({super.key});

  @override
  State<RegisterCandidateSecondForm> createState() =>
      _RegisterCandidateSecondFormState();
}

class _RegisterCandidateSecondFormState
    extends State<RegisterCandidateSecondForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _sloganController = TextEditingController();
  final TextEditingController _speechController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    for (var controller in [_sloganController, _speechController]) {
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
        AppTexts.candidate.bold(fontSize: 36.sp),
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
          _buildRow(),
          context.gaps.large,
          DefaultTextInput(
            textEditingController: _speechController,
            isObscure: true,
            hintText: AppTexts.speechRequirement,
            onTap: null,
          ),
          context.gaps.large,
        ],
      ));

  Row _buildRow() {
    return Row(
      children: [
        CircleAvatar(
          radius: 70.sp,
          backgroundImage: AssetImage(Assets.avatar.path),
        ),
        context.gaps.medium,
        SizedBox(
          width: 130.sp,
          child: DefaultTextInput(
            textEditingController: _sloganController,
            hintText: AppTexts.sloganRequirement,
            onTap: null,
          ),
        ),
      ],
    );
  }
}
