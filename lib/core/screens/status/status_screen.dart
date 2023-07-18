import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_constants.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/app_bar/custom_buttom_app_bar.dart';
import 'package:poll_power/core/commons/app_bar/custom_app_bar.dart';
import 'package:poll_power/core/extensions/extension_on_screen_size.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';
import 'package:poll_power/services/firebase/firebase_service.dart';
import '../../../features/auth/device_state.dart';
import '../../commons/button/custom_button.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({
    super.key,
    required this.status,
    required this.userCount,
    required this.deviceState,
    required this.candidateData,
  });

  final int userCount;
  final DeviceState? deviceState;
  final Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>> candidateData;

  final bool status;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            bottomNavigationBar: CustomBottomAppBar(
              title: getUserOrCandidate(),
              content: AppConstants.lorem,
            ),
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
              CustomButton(
                  deviceState: deviceState,
                  route: "registerCandidate",
                  text: "Candidate",
                  candidateData: candidateData,
                  userCount: userCount,
                  isActive: !data),
              const SizedBox(height: 43),
              CustomButton(
                  deviceState: deviceState,
                  route: "registerVoter",
                  text: "Voter",
                  candidateData: candidateData,
                  userCount: userCount,
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
          SizedBox(height: context.getScreenHeight() * 8 / 100),
          const CustomAppBar(),
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
    }
    return "Candidats";
  }
}
