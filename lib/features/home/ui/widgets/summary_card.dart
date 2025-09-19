import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager/core/helpers/spacing.dart';
import 'package:smart_ahwa_manager/core/theming/text_styles.dart';

import '../../../../core/theming/colors.dart';


class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final VoidCallback? onTap;
  
  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h,horizontal: 5.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: ColorsManager.lighterGray,
            width: 1.0,
          ),

        ),
        child: Column(

          children: [
            Icon(
              icon,
              color: ColorsManager.mainBrown, // Brown color
              size: 24.sp,
            ),
            VSpace(8),
            Text(
              title,
              textAlign: TextAlign.center,
              style:TextStyles.font14BrownMedium,
            ),
            Expanded(child: SizedBox()),
            Text(
              value,
              style: TextStyles.font18BrownRegular,
            ),
          ],
        ),
      ),
    );
  }
}
