import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poll_power/core/common/app_styles.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/ui/theme/buttons/default_buttons.dart';
import 'package:poll_power/core/ui/widgets/default_app_bar.dart';
import 'package:poll_power/presentation/ui/forms/candidate_form_data.dart';
import 'package:poll_power/presentation/ui/forms/register_candidate_first_form.dart';
import 'package:poll_power/presentation/ui/forms/register_candidate_second_form.dart';
import 'package:poll_power/presentation/ui/forms/register_voter_second_form.dart';
import 'package:poll_power/presentation/ui/forms/voter_form_data.dart';

import '../forms/register_common_last_form.dart';
import '../forms/register_voter_first_form.dart';

class RegisterScreen extends StatefulWidget {
  final bool isVoter;
  const RegisterScreen({super.key, required this.isVoter});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final ValueNotifier<CandidateFormDatas?> _candidateFormDatas =
      ValueNotifier(null);
  final ValueNotifier<VoteFormDatas?> _voterFormDatas = ValueNotifier(null);
  late ValueNotifier<Widget> _currentForm;

  @override
  void initState() {
    _currentForm =
        ValueNotifier(RegisterVoterFirstForm(voteFormData: _voterFormDatas));
    if (!widget.isVoter) {
      _currentForm.value = RegisterCandidateFirstForm(
        candidateFormData: _candidateFormDatas,
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    _candidateFormDatas.dispose();
    _currentForm.dispose();
    _voterFormDatas.dispose();
    super.dispose();
  }

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
            ListenableBuilder(
              listenable: _currentForm,
              builder: (context, child) => _currentForm.value,
            ),
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
          callback: () async {
            _left();
          },
        ),
        getArrowButton(
            isLeft: false,
            callback: () async {
              _right();
            })
      ],
    );
  }

  void _right() {
    log(_currentForm.value.toString());
    if (widget.isVoter) {
      _switchVoterForms();
    } else {
      _switchCandidateForms();
    }
  }

  void _switchCandidateForms() {
    switch (_currentForm.value) {
      case RegisterCandidateFirstForm():
        _currentForm.value = RegisterCandidateSecondForm(
          candidateFormData: _candidateFormDatas,
        );
        break;
      case RegisterCandidateSecondForm():
        _currentForm.value = RegisterCommonLastForm(
          isVoter: widget.isVoter,
          voterFormDatas: _voterFormDatas,
          candidateFormDatas: _candidateFormDatas,
        );
        break;
      default:
    }
  }

  void _switchVoterForms() {
    switch (_currentForm.value) {
      case RegisterVoterFirstForm():
        _currentForm.value = RegisterVoterSecondForm(
          voteFormData: _voterFormDatas,
        );
        break;
      case RegisterVoterSecondForm():
        _currentForm.value = RegisterCommonLastForm(
          isVoter: widget.isVoter,
          voterFormDatas: _voterFormDatas,
          candidateFormDatas: _candidateFormDatas,
        );
        break;
      default:
    }
  }

  void _left() {
    log(_currentForm.value.toString());
    if (widget.isVoter) {
      switch (_currentForm.value) {
        case RegisterVoterFirstForm():
          context.pop();
          break;
        case RegisterVoterSecondForm():
          _currentForm.value = RegisterVoterFirstForm(
            voteFormData: _voterFormDatas,
          );
          break;
        case RegisterCommonLastForm():
          _currentForm.value = RegisterVoterSecondForm(
            voteFormData: _voterFormDatas,
          );
          break;
        default:
      }
    } else {
      switch (_currentForm.value) {
        case RegisterCandidateFirstForm():
          context.pop();
          break;
        case RegisterCandidateSecondForm():
          _currentForm.value = RegisterCandidateFirstForm(
              candidateFormData: _candidateFormDatas);
          break;
        case RegisterCommonLastForm():
          _currentForm.value = RegisterCandidateSecondForm(
            candidateFormData: _candidateFormDatas,
          );
        default:
      }
    }
  }
}
