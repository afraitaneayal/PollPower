import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poll_power/core/common/app_texts.dart';
import 'package:poll_power/core/extensions/context_extension.dart';

class DefaultTextInput extends StatelessWidget {
  final String? hintText;
  final AsyncCallback? onTap;
  final bool? isObscure;
  final TextEditingController textEditingController;
  const DefaultTextInput(
      {super.key,
      this.hintText,
      required this.onTap,
      this.isObscure,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: isObscure ?? false,
      onTap: () => onTap,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 20.sp, top: 16.sp, bottom: 16.sp),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.sp)),
      ),
    );
  }
}
