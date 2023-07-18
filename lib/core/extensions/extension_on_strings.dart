import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poll_power/core/app_colors/app_colors.dart';

extension StringAsWidget on String {
  Widget getWidget({double? fontSize, Color? fontColor, fontWeight}) {
    return Text(this,
        style: GoogleFonts.poppins(
          textStyle: const TextStyle(decoration: TextDecoration.none),
          fontSize: fontSize ?? 10,
          color: fontColor ?? AppColors.black,
          fontWeight: fontWeight ?? FontWeight.w400,
        ));
  }
}
