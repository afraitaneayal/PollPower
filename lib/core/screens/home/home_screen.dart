import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_assets.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/app_bar/custom_app_bar.dart';
import 'package:poll_power/core/commons/widget/candidate_card.dart';
import 'package:poll_power/core/commons/widget/timer_widget.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/core/screens/winner/winner_screen.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';
import '../../../features/auth/device_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key,
      required this.candidateData,
      required this.userCount,
      required this.deviceState,
      required this.user});

  final Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> candidateData;
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
    final service = FirebaseService();
    return StreamBuilder<bool>(
        stream: service.getPollState(),
        initialData: false,
        builder: (context, snapshot) {
          final snapshotData = snapshot.data!;
          return Column(children: [
            SizedBox(
              height: context.getScreenHeight() * 5 / 100,
            ),
            _buildAppBar(context),
            SizedBox(
              height: context.getScreenHeight() * 2 / 100,
            ),
            _buildCurentUserCard(context, user),
            const SizedBox(
              height: 7,
            ),
            _buildTimer(snapshotData),
            SizedBox(
              height: context.getScreenHeight() * 2 / 100,
            ),
            snapshotData ? _buildSizeBox(context) : _buildWinner(context),
          ]);
        });
  }

  Widget _buildCurentUserCard(BuildContext context, user) {
    return Container(
      width: context.getScreenWidth() * 90 / 100,
      height: context.getScreenHeight() * 25 / 100,
      decoration: BoxDecoration(
          color: AppColors.purple, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 7),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(AppAssets.eagle),
              ),
              _buildCurentUserCardColumn(),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.black,
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            padding: EdgeInsets.symmetric(
                horizontal: context.getScreenWidth() * 4 / 100,
                vertical: context.getScreenHeight() * 2 / 100),
            child: deviceState!.voted!
                ? "😊 Vous avez deja vote"
                    .getWidget(fontSize: 21, fontColor: AppColors.white)
                : "😢 Vous avez pas encore vote"
                    .getWidget(fontSize: 21, fontColor: AppColors.white),
          )
        ],
      ),
    );
  }

  Widget _buildSizeBox(BuildContext context) {
    return SizedBox(
        height: context.getScreenHeight() * 50 / 100,
        child: StreamBuilder<List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
          stream: candidateData,
          initialData: const [],
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
        ));
  }

  Widget _buildCurentUserCardColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Welcome Back".getWidget(fontSize: 20, fontColor: AppColors.white),
        ("${user.fistName!} ${user.lastName!}").getWidget(
            fontSize: 34,
            fontWeight: FontWeight.w600,
            fontColor: AppColors.white),
      ],
    );
  }

  Widget _buildTimer(snapshotData) {
    return snapshotData
        ? const TimerWidget()
        : Container(
            child: "Fin de l'election".getWidget(fontSize: 24),
          );
  }

  Widget _buildWinner(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(300, 120)),
            backgroundColor: MaterialStateProperty.all(AppColors.black),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)))),
        onPressed: () async {
          final winner = await FirebaseService().getWinner();
          // ignore: use_build_context_synchronously
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WinnerScrenn(
                        winner: winner,
                      )));
        },
        child: "Voir le Winner".getWidget(
            fontSize: 24,
            fontColor: AppColors.white,
            fontWeight: FontWeight.w600));
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: context.getScreenWidth() * 2 / 100),
      child: const CustomAppBar(),
    );
  }
}
