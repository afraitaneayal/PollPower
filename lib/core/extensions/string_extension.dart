import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/ui/theme/buttons/default_buttons.dart';
import 'package:poll_power/core/ui/theme/colors/i_app_colors.dart';
import 'package:poll_power/core/ui/theme/typography/i_app_typography.dart';
import 'package:poll_power/di.dart';

extension StringAsWidgetExtension on String {
  Text light({double? fontSize, Color? color, TextAlign? textAlign}) => Text(
        this,
        textAlign: textAlign ?? TextAlign.left,
        style: locator
            .get<IAppTypography>()
            .light(fontSize: fontSize)
            .copyWith(color: color ?? locator.get<IAppColors>().black),
      );

  Text bold({double? fontSize, Color? color, TextAlign? textAlign}) => Text(
        this,
        textAlign: textAlign ?? TextAlign.left,
        style: locator
            .get<IAppTypography>()
            .bold(fontSize: fontSize)
            .copyWith(color: color ?? locator.get<IAppColors>().black),
      );

  Text semiBold({double? fontSize, Color? color, TextAlign? textAlign}) => Text(
        this,
        textAlign: textAlign ?? TextAlign.left,
        style: locator
            .get<IAppTypography>()
            .semiBold(fontSize: fontSize)
            .copyWith(color: color ?? locator.get<IAppColors>().black),
      );

  InkWell asPrimaryButton(
      {required AsyncCallback callback,
      double? fontSize,
      EdgeInsets? padding}) {
    return getPrimaryButton(
        callback: () async => callback,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: semiBold(
              fontSize: fontSize ?? 20.sp,
              color: locator.get<IAppColors>().white),
        ));
  }

  InkWell asSecondaryButton(
      {required AsyncCallback callback,
      EdgeInsets? padding,
      double? fontSize}) {
    return getSecondaryButton(
        callback: callback,
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: semiBold(
              fontSize: fontSize ?? 20.sp,
              color: locator.get<IAppColors>().black),
        ));
  }
}
