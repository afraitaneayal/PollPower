import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:poll_power/core/common/app_route.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';
import 'package:poll_power/domain/entities/candidate/candidate.dart';

import '../../assets/assets.gen.dart';

class CandidateWidget extends StatelessWidget {
  final CandidateEntity candidate;
  const CandidateWidget({
    super.key,
    required this.candidate,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.push(AppRoutes.candidate, extra: candidate),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 20.sp),
        decoration: BoxDecoration(
            color: context.colors.blue,
            borderRadius: BorderRadius.circular(10.sp)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRow(context),
            context.gaps.medium,
            candidate.slogan.semiBold(
                fontSize: 20.sp,
                color: context.colors.white,
                textAlign: TextAlign.center),
            context.gaps.medium,
            _buildVotingState(context),
          ],
        ),
      ),
    );
  }

  Row _buildRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30.sp,
          backgroundImage: AssetImage(Assets.avatar.path),
        ),
        context.gaps.small,
        "${candidate.user.first_name} ${candidate.user.last_name}"
            .semiBold(color: context.colors.white, fontSize: 20.sp),
      ],
    );
  }

  Container _buildVotingState(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 100.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: context.colors.black),
      child: candidate.vote_count
          .toString()
          .bold(fontSize: 48, color: context.colors.white),
    );
  }
}
