import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/widgets/default_text_input.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/domain/entities/candidate/candidate.dart';
import 'package:poll_power/domain/entities/user/user.dart';
import 'package:poll_power/presentation/state_management/bloc/auth/auth_bloc.dart';
import 'package:poll_power/presentation/state_management/bloc/auth/auth_events.dart';
import 'package:poll_power/presentation/ui/forms/candidate_form_data.dart';
import 'package:poll_power/presentation/ui/forms/voter_form_data.dart';

class RegisterCommonLastForm extends StatefulWidget {
  final bool isVoter;
  final ValueNotifier<CandidateFormDatas?> candidateFormDatas;
  final ValueNotifier<VoteFormDatas?> voterFormDatas;
  const RegisterCommonLastForm({
    super.key,
    required this.isVoter,
    required this.candidateFormDatas,
    required this.voterFormDatas,
  });

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
        widget.isVoter
            ? "Voter".bold(fontSize: 36.sp)
            : "Candidate".bold(fontSize: 36.sp),
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
              callback: () async {
                _onRegisterButtonPressed();
              })
        ],
      ));

  void _onRegisterButtonPressed() {
    widget.isVoter ? _registerVoter() : _registerCandidate();
  }

  _registerVoter() {
    final UserEntity user = UserEntity(
        uuid: null,
        email: _emailController.text,
        password: _passwordController.text,
        first_name: widget.voterFormDatas.value!.voterFirstFormData!.firstName,
        last_name: widget.voterFormDatas.value!.voterFirstFormData!.lastName,
        grade: widget.voterFormDatas.value!.voterFirstFormData!.grade,
        area_of_study:
            widget.voterFormDatas.value!.voterFirstFormData!.areaOfStudy,
        image: widget.voterFormDatas.value!.voterSecondFormData!.image);
    locator.get<AuthBloc>().add(SignUpUserEvent(user));
  }

  _registerCandidate() {
    final CandidateEntity candidate = CandidateEntity(
        slogan: widget.candidateFormDatas.value!.secondFormData!.slogan,
        speech: widget.candidateFormDatas.value!.secondFormData!.speetch ?? "",
        vote_count: 0,
        uuid: null,
        user: UserEntity(
            uuid: null,
            email: _emailController.text,
            password: _passwordController.text,
            first_name:
                widget.candidateFormDatas.value!.firstFormData!.firstName,
            last_name: widget.candidateFormDatas.value!.firstFormData!.lastName,
            grade: widget.candidateFormDatas.value!.firstFormData!.grade,
            area_of_study:
                widget.candidateFormDatas.value!.firstFormData!.areaOfStudy,
            image: widget.candidateFormDatas.value!.secondFormData!.image));
    locator
        .get<AuthBloc>()
        .add(SignUpCandidateEvent(candidate, candidate.user));
  }
}
