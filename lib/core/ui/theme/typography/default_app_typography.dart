import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'i_app_typography.dart';

@Singleton(as: IAppTypography)
class DefaultAppTypography extends IAppTypography {
  @override
  TextStyle get defaultStyle => GoogleFonts.poppins();

  TextStyle copyTextStyle({double? fontSize, FontWeight? fontWeight}) {
    return defaultStyle.copyWith(
        fontSize: fontSize ?? 14.sp,
        fontWeight: fontWeight ?? FontWeight.normal);
  }

  @override
  TextStyle bold({double? fontSize, FontWeight? fontWeight}) =>
      copyTextStyle(fontSize: fontSize, fontWeight: fontWeight);

  @override
  TextStyle light({double? fontSize, FontWeight? fontWeight}) =>
      copyTextStyle(fontSize: fontSize, fontWeight: fontWeight);

  @override
  TextStyle semiBold({double? fontSize, FontWeight? fontWeight}) =>
      copyTextStyle(fontSize: fontSize, fontWeight: fontWeight);
}
