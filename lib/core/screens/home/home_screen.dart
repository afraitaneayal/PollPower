import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_constants.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/app_bar/custom_buttom_app_bar.dart';
import 'package:poll_power/core/commons/widget/candidate_card.dart';
import 'package:poll_power/core/commons/app_bar/custom_app_bar.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key, required this.candidateData, required this.userCount});

  final List candidateData;
  final int userCount;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            backgroundColor: AppColors.background,
            body: _buildHomeContainer(context),
            bottomNavigationBar: CustomBottomAppBar(
              title: "Vote Started",
              content: AppConstants.lorem,
            )),
        onWillPop: () async {
          return false;
        });
  }

  Widget _buildHomeContainer(BuildContext context) {
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: context.getScreenWidth() * 5 / 100,
            vertical: context.getScreenHeight() * 1 / 100),
        child: _buildColumn(context));
  }

  Widget _buildColumn(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: context.getScreenHeight() * 7.5 / 100,
      ),
      const CustomAppBar(),
      SizedBox(
        height: context.getScreenHeight() * 80 / 100,
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
}
