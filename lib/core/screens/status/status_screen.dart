import 'package:flutter/material.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';
import 'package:poll_power/core/commons/app_bar/custom_buttom_app_bar.dart';
import 'package:poll_power/core/commons/button/custom_elevate_button.dart';
import 'package:poll_power/core/commons/widget/custom_app_bar.dart';
import 'package:poll_power/core/extensions/extension_on_strings.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key, required this.status});

  final bool status;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            bottomNavigationBar: const CustomBottomAppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const CustomAppBar(),
                  const SizedBox(height: 100),
                  _buildtext(),
                  const SizedBox(height: 80),
                  Container(
                    alignment: Alignment.center,
                    child: _buildButtonText(context),
                  ),
                ],
              ),
            )),
        onWillPop: () async {
          return false;
        });
  }

  Widget _buildButtonText(context) {
    if (status) {
      return _buildColumn(context: context, currentState: true);
    } else {
      return _buildColumn(context: context, currentState: false);
    }
  }

  Widget _buildtext() {
    return "What are you ?".getWidget(
        fontColor: AppColors.black, fontSize: 42, fontWeight: FontWeight.w600);
  }

  Widget _buildColumn({BuildContext? context, bool? currentState}) {
    final currentCandidateState = !currentState!;
    return Column(
      children: [
        CustomElevateButton().getElevateButton(
            context: context,
            route: "registerCandidate",
            text: "Candidate",
            isActive: currentCandidateState),
        const SizedBox(height: 43),
        CustomElevateButton().getElevateButton(
            context: context,
            route: "registerVoter",
            text: "Voter",
            isActive: currentState),
      ],
    );
  }
}
