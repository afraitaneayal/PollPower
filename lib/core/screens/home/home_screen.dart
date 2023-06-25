import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/app_bar/custom_app_bar.dart';
import 'package:poll_power/core/commons/widget/candidate_card.dart';
import 'package:poll_power/core/commons/widget/profile_pic_widget.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

import '../../../features/auth/user_entity.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key,
      required this.candidateData,
      required this.userCount,
      required this.user});

  final List candidateData;
  final int userCount;
  final User user;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: _buildHomeContainer(context),
          // bottomNavigationBar: CustomBottomAppBar(
          //   title: "Vote Started",
          //   content: AppConstants.lorem,
          // )
        ),
        onWillPop: () async {
          return false;
        });
  }

  Widget _buildHomeContainer(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.only(
          left: context.getScreenWidth() * 3 / 100,
          right: context.getScreenWidth() * 3 / 100,
        ),
        child: _buildColumn(context));
  }

  Widget _buildColumn(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: context.getScreenHeight() * 4 / 100,
      ),
      const CustomAppBar(),
      _buildCurentUserCard(context, user),
      SizedBox(
        height: context.getScreenHeight() * 70 / 100,
        child: ListView.builder(
            itemCount: candidateData.length,
            itemBuilder: (context, index) {
              return CandidateCard(
                userCount: userCount,
                firstName: candidateData[index]['firstName'],
                lastName: candidateData[index]['lastName'],
                speetch: candidateData[index]['speetch'],
                voteCount: candidateData[index]['voteCount'] ?? 0,
              );
            }),
      )
    ]);
  }

  Widget _buildCurentUserCard(BuildContext context, User user) {
    final profilLetters = user.fistName![0] + user.lastName![0];
    final isVoted = user.voted!;
    return Container(
      width: context.getScreenWidth() * 90 / 100,
      decoration: BoxDecoration(
          color: AppColors.purple, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 7),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: context.getScreenHeight() * 15 / 100,
      child: Wrap(
        spacing: 20,
        children: [
          ProfilPic(firstLetter: profilLetters),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Welcome back"
                  .getWidget(fontSize: 20, fontColor: AppColors.white),
              (user.fistName! + user.lastName!).getWidget(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.white),
              isVoted
                  ? "vous avez deja vote"
                      .getWidget(fontSize: 20, fontColor: AppColors.white)
                  : "vous avez pas encore vote"
                      .getWidget(fontSize: 20, fontColor: AppColors.white)
            ],
          )
        ],
      ),
    );
  }
}
