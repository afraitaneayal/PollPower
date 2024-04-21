import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_styles.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/core/ui/widgets/candidate_widget.dart';
import 'package:poll_power/core/ui/widgets/default_app_bar.dart';
import 'package:poll_power/core/ui/widgets/timer_widget.dart';
import 'package:poll_power/core/ui/widgets/user_card_widget.dart';
import 'package:poll_power/presentation/state_management/bloc/candidate/candidate_bloc.dart';
import 'package:poll_power/presentation/state_management/bloc/candidate/candidate_state.dart';

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
              BlocBuilder<CandidateBloc, CandidateState>(
                builder: (context, state) {
                  if (state is GetCandidateIsProcessing ||
                      state is CandidateInitialState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: context.colors.black,
                      ),
                    );
                  } else if (state is GetCandidatesDone) {
                    return _buildCandidates(state);
                  } else if (state is GetCandidatesFailed) {
                    return Center(child: state.error.light());
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _buildCandidates(GetCandidatesDone state) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 10.sp,
          children: state.candidates
              .map((e) => CandidateWidget(
                    candidate: e,
                  ))
              .toList(),
        ));
  }
}
