import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'i_app_typography.dart';

@Singleton(as: IAppTypography)
class DefaultAppTypography extends IAppTypography {
  TextStyle copyTextStyle({double? fontSize, FontWeight? fontWeight}) {
    return GoogleFonts.poppins(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.normal);
  }

  @override
  TextStyle bold({double? fontSize}) =>
      copyTextStyle(fontSize: fontSize, fontWeight: FontWeight.bold);

  @override
  TextStyle light({double? fontSize}) =>
      copyTextStyle(fontSize: fontSize, fontWeight: FontWeight.normal);

  @override
  TextStyle semiBold({double? fontSize, FontWeight? fontWeight}) =>
      copyTextStyle(fontSize: fontSize, fontWeight: FontWeight.w600);
}
