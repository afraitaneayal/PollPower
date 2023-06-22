import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/app_bar/custom_buttom_app_bar.dart';
import 'package:poll_power/core/commons/widget/custom_app_bar.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';
import '../../commons/button/custom_button.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key, required this.status});

  final bool status;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            bottomNavigationBar:
                CustomBottomAppBar(isUserOrCandidate: getUserOrCandidate()),
            body: Container(
                color: AppColors.background,
                child: _buildStatusPadding(context))),
        onWillPop: () async {
          return false;
        });
  }

  Widget _buildtext() {
    return "What are you ?".getWidget(
        fontColor: AppColors.black, fontSize: 42, fontWeight: FontWeight.w600);
  }

  Widget _buildColumn() {
    final service = FirebaseService();
    return StreamBuilder<bool>(
        stream: service.getStartStatusWithStream(),
        initialData: false,
        builder: (context, statusSnapshot) {
          final data = statusSnapshot.data!;
          return Column(
            children: [
              CustomButton().getCustomButton(
                  context: context,
                  route: "registerCandidate",
                  text: "Candidate",
                  isActive: !data),
              const SizedBox(height: 43),
              CustomButton().getCustomButton(
                  context: context,
                  route: "registerVoter",
                  text: "Voter",
                  isActive: data),
            ],
          );
        });
  }

  Widget _buildStatusPadding(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          CustomAppBar(status: status),
          const SizedBox(height: 100),
          _buildtext(),
          const SizedBox(height: 80),
          Container(
            alignment: Alignment.center,
            child: _buildColumn(),
          ),
        ],
      ),
    );
  }

  String getUserOrCandidate() {
    if (status) {
      return "Voter";
    } else {
      return "Candidats";
    }
  }
}
