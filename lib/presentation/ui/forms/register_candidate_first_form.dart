import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/widgets/default_text_input.dart';

import 'candidate_form_data.dart';

class RegisterCandidateFirstForm extends StatefulWidget {
  final ValueNotifier<CandidateFormDatas?> candidateFormData;

  const RegisterCandidateFirstForm(
      {super.key, required this.candidateFormData});

  @override
  State<RegisterCandidateFirstForm> createState() =>
      _RegisterCandidateFirstFormState();
}

class _RegisterCandidateFirstFormState
    extends State<RegisterCandidateFirstForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _areaOfStudyController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();

  @override
  void initState() {
    _firstNameController.text = (widget.candidateFormData.value != null)
        ? widget.candidateFormData.value!.firstFormData!.firstName
        : "";
    _lastNameController.text = (widget.candidateFormData.value != null)
        ? widget.candidateFormData.value!.firstFormData!.lastName
        : "";
    _areaOfStudyController.text = (widget.candidateFormData.value != null)
        ? widget.candidateFormData.value!.firstFormData!.areaOfStudy
        : "";
    _gradeController.text = (widget.candidateFormData.value != null)
        ? widget.candidateFormData.value!.firstFormData!.grade
        : "";
    super.initState();
  }

  @override
  void dispose() {
    widget.candidateFormData.value = CandidateFormDatas(
      firstFormData: CandidateFirstFormData(
          _firstNameController.text,
          _lastNameController.text,
          _areaOfStudyController.text,
          _gradeController.text),
    );

    for (var controller in [
      _firstNameController,
      _lastNameController,
      _gradeController,
      _areaOfStudyController
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
