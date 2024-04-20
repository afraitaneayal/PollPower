import 'package:flutter/material.dart';
import 'package:poll_power/core/common/app_styles.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/ui/widgets/candidate_widget.dart';
import 'package:poll_power/core/ui/widgets/default_app_bar.dart';
import 'package:poll_power/core/ui/widgets/timer_widget.dart';
import 'package:poll_power/core/ui/widgets/user_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.white,
      body: Padding(
        padding: AppStyles.defaultScreenPadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DefaultAppBar(),
              context.gaps.large,
              const UserCardWidget(isCandidate: false),
              context.gaps.medium,
              const TimerWidget(),
              context.gaps.medium,
              const CandidateWidget()
            ],
          ),
        ),
      ),
    );
  }
}
