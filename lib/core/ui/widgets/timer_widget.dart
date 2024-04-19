import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/core/extensions/string_extension.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 75.sp),
      decoration: BoxDecoration(
          color: context.colors.black,
          borderRadius: BorderRadius.circular(10.sp)),
      child: Column(
        children: [
          AppTexts.timer.semiBold(fontSize: 20.sp, color: context.colors.white),
          "2d 6h 24m".bold(fontSize: 32, color: context.colors.white)
        ],
      ),
    );
  }
}
