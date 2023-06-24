import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_constants.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/app_bar/custom_buttom_app_bar.dart';
import 'package:poll_power/core/commons/widget/profile_pic_widget.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class CandidateScreen extends StatelessWidget {
  const CandidateScreen(
      {super.key,
      required this.firstName,
      required this.lastName,
      required this.speetch,
      required this.voteCount});

  final String? firstName;
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

  Widget _buildColumn(BuildContext context) {
    final profilLetters = firstName![0] + lastName![0];
    final fullName = "$firstName $lastName";
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
            horizontal: context.getScreenHeight() * 4 / 100),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: context.getScreenHeight() * 2 / 100),
              SizedBox(height: context.getScreenHeight() * 5 / 100),
              ProfilPic(firstLetter: profilLetters),
              SizedBox(height: context.getScreenHeight() * 5 / 100),
              fullName.getWidget(fontSize: 42, fontWeight: FontWeight.w700),
              SizedBox(height: context.getScreenHeight() * 10 / 100),
              speetch!.getWidget(fontSize: 20),
              SizedBox(height: context.getScreenHeight() * 10 / 100),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(AppColors.black)),
                  onPressed: () {},
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
