import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_constants.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/app_bar/custom_buttom_app_bar.dart';
import 'package:poll_power/core/commons/widget/profile_pic_widget.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/core/screens/home/home_screen.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';
import 'package:poll_power/services/user/isar_services.dart';

class CandidateScreen extends StatelessWidget {
  const CandidateScreen(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.speetch,
      required this.areaOfStudy,
      required this.candidateID,
      required this.grade,
      required this.phoneNumber,
      required this.isVoted,
      required this.voteCount});

  final String areaOfStudy;
  final String grade;
  final String phoneNumber;
  final String candidateID;
  final String? firstName;
  final bool isVoted;
  final String? lastName;
  final String? speetch;
  final int? voteCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: _buildColumn(context),
      bottomNavigationBar: CustomBottomAppBar(
        title: "",
        content: AppConstants.lorem,
      ),
    );
  }

  Widget _buildColumn(context) {
    final profilLetters = firstName![0] + lastName![0];
    final fullName = "$firstName $lastName";

    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 4 / 100),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 2 / 100),
              SizedBox(height: MediaQuery.of(context).size.height * 5 / 100),
              ProfilPic(firstLetter: profilLetters),
              SizedBox(height: MediaQuery.of(context).size.height * 5 / 100),
              fullName.getWidget(fontSize: 42, fontWeight: FontWeight.w700),
              SizedBox(height: MediaQuery.of(context).size.height * 3 / 100),
              grade.getWidget(fontSize: 20),
              areaOfStudy.getWidget(fontSize: 20),
              "Numero de telephone : $phoneNumber".getWidget(fontSize: 20),
              SizedBox(height: MediaQuery.of(context).size.height * 5 / 100),
              speetch!.getWidget(fontSize: 20),
              SizedBox(height: MediaQuery.of(context).size.height * 10 / 100),
              isVoted
                  ? Container()
                  : ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.black)),
                      onPressed: () async {
                        final candidate = {
                          "firstName": firstName,
                          "lastName": lastName,
                          "grade": grade,
                          "candidateID": candidateID,
                          "areaOfStudy": areaOfStudy,
                          "speetch": speetch,
                          "phoneNumber": phoneNumber,
                          "voteCount": voteCount! + 1
                        };
                        await FirebaseService()
                            .updateCandidateVoteCount(candidate);
                        // IsarServices().updateUserVotedState();

                        final isarUser = await IsarServices().getUser();
                        final candidateData =
                            await FirebaseService().getCandidates();
                        final userCount =
                            await FirebaseService().getUserCount();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen(
                                      candidateData: candidateData,
                                      user: isarUser,
                                      userCount: userCount,
                                    )));
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: "Vote".getWidget(
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                            fontColor: AppColors.white),
                      ))
            ],
          ),
        ));
  }
}
