import 'package:flutter/material.dart';
import 'package:poll_power/core/ui/theme/colors/i_app_colors.dart';
import 'package:poll_power/core/ui/theme/typography/i_app_typography.dart';
import 'package:poll_power/di.dart';

extension StringAsWidgetExtension on String {
  Text light({double? fontSize, FontWeight? fontWeight, Color? color}) => Text(
        this,
        style: locator
            .get<IAppTypography>()
            .light(fontSize: fontSize, fontWeight: fontWeight)
            .copyWith(color: color ?? locator.get<IAppColors>().black),
      );

  Text bold({double? fontSize, FontWeight? fontWeight, Color? color}) => Text(
        this,
        style: locator
            .get<IAppTypography>()
            .bold(fontSize: fontSize, fontWeight: fontWeight)
            .copyWith(color: color ?? locator.get<IAppColors>().black),
      );

  Text semiBold({double? fontSize, FontWeight? fontWeight, Color? color}) =>
      Text(
        this,
        style: locator
            .get<IAppTypography>()
            .semiBold(fontSize: fontSize, fontWeight: fontWeight)
            .copyWith(color: color ?? locator.get<IAppColors>().black),
      );
}
