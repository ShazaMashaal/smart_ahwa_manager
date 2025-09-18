
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';
import 'font_wieght_helper.dart';

class TextStyles {
  static TextStyle font24BlackBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  static TextStyle font24BrownBold = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeightHelper.bold,
    color: ColorsManager.mainBrown,
  );
  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.gray,
  );
  static TextStyle font14LightGrayMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.lightGray,
  );

  static TextStyle font14NavyMedium = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeightHelper.medium,
    color: ColorsManager.navy,
  );
  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeightHelper.semibold,
    color: Colors.white,
  );
  static TextStyle font12BlueRegular = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeightHelper.regular,
    color: ColorsManager.mainBrown,
  );
  static TextStyle font12Gray400Weight = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: ColorsManager.gray,
  );
  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBrown,
  );
}
