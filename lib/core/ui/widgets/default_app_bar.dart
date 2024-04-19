import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/string_extension.dart';

import '../../assets/assets.gen.dart';

class DefaultAppBar extends StatelessWidget {
  const DefaultAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppTexts.appName.bold(fontSize: 24.sp),
        Assets.logoSmall.image(),
      ],
    );
  }
}
