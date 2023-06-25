import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/widget/profile_pic_widget.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/core/screens/candidate/candidate_screen.dart';

class CandidateCard extends StatelessWidget {
  const CandidateCard(
      {super.key,
      required this.userCount,
      required this.firstName,
      required this.lastName,
      required this.speetch,
      required this.voteCount});

  final int userCount;
  final String firstName;
  final String lastName;
  final String speetch;
  final int voteCount;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CandidateScreen(
                      firstName: firstName,
                      lastName: lastName,
                      speetch: speetch,
                      voteCount: voteCount)));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.sky,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.getScreenWidth() / 14,
          ),
          height: context.getScreenHeight() * 30 / 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRow(context, firstName, lastName),
              const SizedBox(
                height: 20,
              ),
              // _buildSpeetch(),
              const SizedBox(
                height: 20,
              ),
              _buildVoteCount(context: context, voteCount: voteCount),
            ],
          ),
        ));
  }

  Widget _buildRow(BuildContext context, String firstName, String lastName) {
    final profilLetters = firstName[0] + lastName[0];
    final fullName = "$firstName $lastName";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfilPic(firstLetter: profilLetters),
        fullName.getWidget(fontSize: 30)
      ],
    );
  }

  // Widget _buildSpeetch() {
  //   return Container(
  //     child: speetch!.getWidget(
  //       fontColor: AppColors.white,
  //       fontSize: 24,
  //     ),
  //   );
  // }

  Widget _buildVoteCount({BuildContext? context, int? voteCount}) {
    final votePercent = voteCount! * 100 / userCount;
    final percent = votePercent.toInt();
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: context!.getScreenWidth() / 3.5,
          vertical: context.getScreenHeight() / 24),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.black),
      child: "$percent %".getWidget(
          fontColor: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700),
    );
  }
}
