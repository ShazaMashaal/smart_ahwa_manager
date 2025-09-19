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
  final String? errorText;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

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
    this.errorText,
    this.onChanged, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validator ,
      controller: controller,
      onChanged: onChanged,
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
        errorBorder:
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: Colors.red.shade900,
                width: 1.w,
              ),
            ),
        errorStyle: TextStyle(color: Colors.red.shade900),
        hintStyle: hintStyle ?? TextStyles.font14LightGrayMedium,
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? ColorsManager.whiteGray,
        errorText: errorText,
      ),

      obscureText: isObscureText ?? false,
      style: inputTextStyle ?? TextStyles.font14BrownMedium,
    );
  }
}
