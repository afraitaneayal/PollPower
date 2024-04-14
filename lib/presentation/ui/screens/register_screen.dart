import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poll_power/core/common/app_styles.dart';
import 'package:poll_power/core/common/app_texts.dart';
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
  final ValueNotifier<Widget> _currentForm =
      ValueNotifier(const RegisterVoterFirstForm());
  late ValueNotifier<CandidateFormDatas> _candidateFormDatas;
  late ValueNotifier<VoteFormDatas> _voterFormDatas;

  @override
  void initState() {
    if (!widget.isVoter) {
      _currentForm.value = const RegisterCandidateFirstForm();
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
            const RegisterVoterFirstForm(),
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
            _validateForm() ? _left() : null;
          },
        ),
        getArrowButton(
            isLeft: false,
            callback: () async {
              _validateForm() ? _right() : null;
            })
      ],
    );
  }

  void _right() {
    if (widget.isVoter) {
      switch (_currentForm.value) {
        case RegisterVoterFirstForm():
          _currentForm.value = const RegisterVoterSecondForm();
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
    } else {
      switch (_currentForm.value) {
        case RegisterCandidateFirstForm():
          _currentForm.value = const RegisterCandidateSecondForm();
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
  }

  void _left() {
    if (widget.isVoter) {
      switch (_currentForm.value) {
        case RegisterVoterFirstForm():
          context.pop();
          break;
        case RegisterVoterSecondForm():
          _currentForm.value = const RegisterVoterFirstForm();
          break;
        default:
      }
    } else {
      switch (_currentForm.value) {
        case RegisterCandidateFirstForm():
          context.pop();
          break;
        case RegisterCandidateSecondForm():
          _currentForm.value = const RegisterCandidateFirstForm();

        default:
      }
    }
  }

  bool _validateForm() {
    return true;
  }
}
