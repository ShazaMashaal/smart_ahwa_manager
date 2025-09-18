import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? inputTextStyle, hintStyle;
  final InputBorder? focusedBorder, enabledBorder;
  final String hintText;
  final Color? fillColor;
  final TextEditingController? controller;
  final bool? isObscureText;
  final Widget? suffixIcon;

  const CustomTextFormField({
    super.key,
    this.contentPadding,
    this.inputTextStyle,
    this.hintStyle,
    this.focusedBorder,
    this.enabledBorder,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.controller,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            contentPadding ??
            EdgeInsets.symmetric(vertical: 17.h, horizontal: 20.w),
        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: ColorsManager.mainBrown),
            ),
        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: ColorsManager.lighterGray,
                width: 2.w,
              ),
            ),
        hintStyle: hintStyle ?? TextStyles.font14LightGrayMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? ColorsManager.whiteGray,
      ),

      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14NavyMedium,
    );
  }
}
