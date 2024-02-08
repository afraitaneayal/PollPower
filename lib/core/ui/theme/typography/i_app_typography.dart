import 'package:flutter/material.dart';

abstract class IAppTypography {
  TextStyle get defaultStyle;

  TextStyle light({double? fontSize, FontWeight? fontWeight});
  TextStyle bold({double? fontSize, FontWeight? fontWeight});
  TextStyle semiBold({double? fontSize, FontWeight? fontWeight});
}
