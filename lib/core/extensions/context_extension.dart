import 'package:flutter/material.dart';
import 'package:poll_power/core/ui/theme/colors/i_app_colors.dart';
import 'package:poll_power/core/ui/theme/gaps/i_app_gaps.dart';
import 'package:poll_power/core/ui/theme/typography/i_app_typography.dart';
import 'package:poll_power/di.dart';

extension GetItFromContextExtension on BuildContext {
  IAppColors get colors => locator.get<IAppColors>();
  IAppGaps get gaps => locator.get<IAppGaps>();
  IAppTypography get typography => locator.get<IAppTypography>();
}
