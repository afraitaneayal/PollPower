import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';

import '../../assets/assets.gen.dart';

class CandidateWidget extends StatelessWidget {
  const CandidateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 40.sp),
      decoration: BoxDecoration(
          color: context.colors.blue,
          borderRadius: BorderRadius.circular(10.sp)),
      child: Column(
        children: [
          _buildRow(context),
          context.gaps.medium,
          "Vote for healthy study environment".semiBold(
              fontSize: 24.sp,
              color: context.colors.white,
              textAlign: TextAlign.center),
          context.gaps.medium,
          _buildVotingState(context),
        ],
      ),
    );
  }

  Row _buildRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 30.sp,
          backgroundImage: AssetImage(Assets.avatar.path),
        ),
        "Afraitane Ayal".semiBold(color: context.colors.white, fontSize: 20.sp),
      ],
    );
  }

  Container _buildVotingState(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 60.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.sp),
          color: context.colors.black),
      child: "33%".bold(fontSize: 48, color: context.colors.white),
    );
  }
}
