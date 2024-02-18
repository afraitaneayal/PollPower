import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/assets/assets.gen.dart';
import 'package:poll_power/core/ui/theme/colors/i_app_colors.dart';
import 'package:poll_power/di.dart';

InkWell getPrimaryButton(
    {required AsyncCallback callback, required Widget child}) {
  return InkWell(
    onTap: callback,
    enableFeedback: true,
    child: Container(
        decoration: BoxDecoration(
            color: locator.get<IAppColors>().black,
            borderRadius: BorderRadius.circular(25.sp)),
        child: child),
  );
}

InkWell getSecondaryButton(
    {required AsyncCallback callback, required Widget child}) {
  return InkWell(
    onTap: callback,
    enableFeedback: true,
    child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25.sp)),
        child: child),
  );
}

InkWell getArrowButton(
    {required AsyncCallback callback, required bool isLeft}) {
  return InkWell(
    onTap: () => callback,
    enableFeedback: true,
    child: Padding(
      padding: EdgeInsets.all(10.sp),
      child: isLeft ? Assets.back.image() : Assets.next.image(),
    ),
  );
}
