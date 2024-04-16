import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/widgets/default_text_input.dart';

import 'voter_form_data.dart';

class RegisterVoterFirstForm extends StatefulWidget {
  final ValueNotifier<VoteFormDatas?> voteFormData;
  const RegisterVoterFirstForm({super.key, required this.voteFormData});

  @override
  State<RegisterVoterFirstForm> createState() => _RegisterVoterFirstFormState();
}

class _RegisterVoterFirstFormState extends State<RegisterVoterFirstForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _areaOfStudyController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();

  @override
  void initState() {
    _firstNameController.text = (widget.voteFormData.value != null)
        ? widget.voteFormData.value!.voterFirstFormData!.firstName
        : "";
    _lastNameController.text = (widget.voteFormData.value != null)
        ? widget.voteFormData.value!.voterFirstFormData!.lastName
        : "";
    _areaOfStudyController.text = (widget.voteFormData.value != null)
        ? widget.voteFormData.value!.voterFirstFormData!.areaOfStudy
        : "";
    _gradeController.text = (widget.voteFormData.value != null)
        ? widget.voteFormData.value!.voterFirstFormData!.grade
        : "";
    super.initState();
  }

  @override
  void dispose() {
    final List<TextEditingController> controllers = [
      _firstNameController,
      _lastNameController,
      _gradeController,
      _areaOfStudyController
    ];

    widget.voteFormData.value = VoteFormDatas(
        voterFirstFormData: VoterFirstFormData(
            _firstNameController.text,
            _lastNameController.text,
            _areaOfStudyController.text,
            _gradeController.text));

    for (var c in controllers) {
      c.dispose();
    }
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
            textEditingController: _firstNameController,
            hintText: AppTexts.firstNameRequirement,
            onTap: null,
          ),
          context.gaps.large,
          DefaultTextInput(
            textEditingController: _lastNameController,
            hintText: AppTexts.lastNameRequirement,
            onTap: null,
          ),
          context.gaps.large,
          DefaultTextInput(
            textEditingController: _gradeController,
            hintText: AppTexts.gradeRequirement,
            onTap: null,
          ),
          context.gaps.large,
          DefaultTextInput(
            textEditingController: _areaOfStudyController,
            hintText: AppTexts.areaOfStudyRequirement,
            onTap: null,
          ),
          context.gaps.large,
        ],
      ));
}
