import 'package:flutter/material.dart';
import 'package:poll_power/core/app_assets/app_constants.dart';
import 'package:poll_power/core/commons/app_bar/custom_buttom_app_bar.dart';
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
      body: Container(
        alignment: Alignment.center,
        child: "$firstName".getWidget(),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        title: "",
        content: AppConstants.lorem,
      ),
    );
  }
}
