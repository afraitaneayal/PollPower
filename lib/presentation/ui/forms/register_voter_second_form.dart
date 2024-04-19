import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/assets/assets.gen.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';

import 'voter_form_data.dart';

class RegisterVoterSecondForm extends StatefulWidget {
  final ValueNotifier<VoteFormDatas?> voteFormData;

  const RegisterVoterSecondForm({super.key, required this.voteFormData});

  @override
  State<RegisterVoterSecondForm> createState() =>
      _RegisterVoterSecondFormState();
}

class _RegisterVoterSecondFormState extends State<RegisterVoterSecondForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ValueNotifier<bool> _isImageReady = ValueNotifier(false);
  final ValueNotifier<String> _image = ValueNotifier("");

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.voteFormData.value = VoteFormDatas(
        voterFirstFormData: widget.voteFormData.value!.voterFirstFormData,
        voterSecondFormData: VoterSecondFormData(_image.value));
    _isImageReady.dispose();
    _image.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTexts.voter.bold(fontSize: 36.sp),
        context.gaps.large,
        context.gaps.large,
        _buildForm(context),
        context.gaps.small,
      ],
    );
  }

  Form _buildForm(BuildContext context) => Form(
      key: _formKey,
      child: Center(
        child: InkWell(
          child: CircleAvatar(
            radius: 90.sp,
            backgroundImage: AssetImage(Assets.avatar.path),
          ),
        ),
      ));
}
