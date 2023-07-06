import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/app_bar/custom_app_bar.dart';
import 'package:poll_power/core/commons/widget/candidate_card.dart';
import 'package:poll_power/core/commons/widget/profile_pic_widget.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import '../../../features/auth/device_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key,
      required this.candidateData,
      required this.userCount,
      required this.deviceState,
      required this.user});

  final Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>?
      candidateData;
  final int userCount;
  final DeviceState? deviceState;
  final dynamic user;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: _buildHomeContainer(context, user),
        ),
        onWillPop: () async {
          return false;
        });
  }

  Widget _buildHomeContainer(BuildContext context, dynamic user) {
    return SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          left: context.getScreenWidth() * 3 / 100,
          right: context.getScreenWidth() * 3 / 100,
        ),
        child: _buildColumn(context, user));
  }

  Widget _buildColumn(BuildContext context, dynamic user) {
    return Column(children: [
      SizedBox(
        height: context.getScreenHeight() * 5 / 100,
      ),
      const CustomAppBar(),
      _buildCurentUserCard(context, user),
      SizedBox(
          height: context.getScreenHeight() * 70 / 100,
          child:
              StreamBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
            stream: candidateData,
            builder: (context, snapshot) {
              final data = snapshot.data!;
              return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return CandidateCard(
                      userCount: userCount,
                      user: user,
                      cardColor: data[index]['cardColor'],
                      candidateID: data[index]['candidateID'],
                      firstName: data[index]['firstName'],
                      lastName: data[index]['lastName'],
                      phoneNumber: data[index]['phoneNumber'],
                      grade: data[index]['grade'],
                      areaOfStudy: data[index]['areaOfStudy'],
                      speetch: data[index]['speetch'],
                      voteCount: data[index]['voteCount'],
                    );
                  });
            },
          ))
    ]);
  }

  Widget _buildCurentUserCard(BuildContext context, user) {
    final profilLetters = user.fistName![0] + user.lastName![0];
    return Container(
      width: context.getScreenWidth() * 90 / 100,
      height: context.getScreenHeight() * 25 / 100,
      decoration: BoxDecoration(
          color: AppColors.purple, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 7),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Wrap(
        spacing: 20,
        children: [
          ProfilPic(firstLetter: profilLetters),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Welcome back"
                  .getWidget(fontSize: 20, fontColor: AppColors.white),
              ("${user.fistName!} ${user.lastName!}").getWidget(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.white),
              deviceState!.voted!
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
