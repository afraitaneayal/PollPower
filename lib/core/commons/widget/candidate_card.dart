import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/widget/profile_pic_widget.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/core/screens/candidate/candidate_screen.dart';
import 'package:poll_power/services/user/isar_services.dart';

class CandidateCard extends StatelessWidget {
  const CandidateCard(
      {super.key,
      required this.userCount,
      required this.firstName,
      required this.lastName,
      required this.speetch,
      required this.areaOfStudy,
      required this.grade,
      required this.candidateID,
      required this.phoneNumber,
      required this.user,
      required this.cardColor,
      required this.voteCount});

  final String areaOfStudy;
  final int cardColor;
  final String grade;
  final String candidateID;
  final String phoneNumber;
  final int userCount;
  final dynamic user;
  final String firstName;
  final String lastName;
  final String speetch;
  final int voteCount;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          final deviceState = await IsarServices().getDeviceState();
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CandidateScreen(
                      device: deviceState,
                      firstName: firstName,
                      lastName: lastName,
                      candidateID: candidateID,
                      speetch: speetch,
                      grade: grade,
                      areaOfStudy: areaOfStudy,
                      phoneNumber: phoneNumber,
                      user: user,
                      voteCount: voteCount)));
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(cardColor),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.getScreenWidth() / 14,
          ),
          height: context.getScreenHeight() * 55 / 100,
          width: context.getScreenWidth() * 85 / 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildRow(context, firstName, lastName, areaOfStudy, grade),
              const SizedBox(
                height: 30,
              ),
              _buildSpeetch(),
              const SizedBox(
                height: 30,
              ),
              _buildVoteCount(context: context, voteCount: voteCount),
            ],
          ),
        ));
  }

  Widget _buildRow(BuildContext context, String firstName, String lastName,
      String areaOfStudy, String garde) {
    final profilLetters = firstName[0] + lastName[0];
    final fullName = "$firstName $lastName";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ProfilPic(firstLetter: profilLetters),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            fullName.getWidget(fontSize: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                areaOfStudy.getWidget(fontSize: 24),
                ", ".getWidget(fontSize: 24),
                grade.getWidget(fontSize: 24)
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildSpeetch() {
    return Container(
      child: "${speetch.substring(0, 100)} ...".getWidget(
        fontColor: AppColors.white,
        fontSize: 24,
      ),
    );
  }

  Widget _buildVoteCount({BuildContext? context, int? voteCount}) {
    final votePercent = voteCount! * 100 / userCount;
    final percent = votePercent.toInt();
    return Container(
      alignment: Alignment.center,
      width: context!.getScreenWidth() * 80 / 100,
      padding: EdgeInsets.symmetric(
          horizontal: context.getScreenWidth() / 3.5,
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
