import 'package:flutter/material.dart';
import 'package:poll_power/core/commons/form/custom_candidate_form.dart';
import 'package:poll_power/core/commons/form/custom_voter_form.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import '../../app_colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.route,
      required this.text,
      required this.isActive,
      required this.userCount,
      required this.candidateData});

  final bool isActive;
  final String route;
  final String text;
  final int userCount;
  final List<dynamic> candidateData;

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return TextButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(410, 170)),
              backgroundColor: MaterialStateProperty.all(AppColors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)))),
          onPressed: !isActive
              ? null
              : () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    if (route == "registerVoter") {
                      return CustomVoterForm(
                        userCount: userCount,
                        candidateData: candidateData,
                      );
                    } else {
                      return CustomCandidateForm(
                        userCount: userCount,
                        candidateData: candidateData,
                      );
                    }
                  })),
          child: text.getWidget(
              fontColor: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.w600));
    } else {
      return TextButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(300, 150)),
              backgroundColor: MaterialStateProperty.all(Colors.black12),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0)))),
          onPressed: () {},
          child: text.getWidget(
              fontColor: Colors.black12,
              fontSize: 34,
              fontWeight: FontWeight.w600));
    }
  }
}
