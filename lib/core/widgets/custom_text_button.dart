import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager/core/helpers/extensions.dart';

import '../theming/colors.dart';
import '../theming/text_styles.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? routeName;
  final String text;
  final double? width,height,fontSize;

  const CustomTextButton({
    super.key,
    this.onPressed,
    this.routeName,
    required this.text, this.width, this.height, this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: routeName != null
          ? () {
              context.pushNamed(routeName!);
            }
          : onPressed,

      style: ButtonStyle(
        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 14.h)),
        backgroundColor: WidgetStatePropertyAll(ColorsManager.mainBrown),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: WidgetStatePropertyAll(Size(width?? 100.sw,height?? 52.h)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
        ),
      ),
      child: Text(text, style: TextStyles.font16WhiteSemiBold.copyWith(fontSize:fontSize )),
    );
  }
}
