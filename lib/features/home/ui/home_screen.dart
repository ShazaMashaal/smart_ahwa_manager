import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager/core/helpers/spacing.dart';
import 'package:smart_ahwa_manager/core/theming/text_styles.dart';
import 'package:smart_ahwa_manager/core/widgets/custom_text_form_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        padding:EdgeInsetsDirectional.symmetric(horizontal: 30.w,vertical: 30.h),
        child: Column(children: [
        Text("Add Order",style: TextStyles.font24BrownBold,),
          VSpace(10),
          Form(
            child: Column(
              children: [
                CustomTextFormField(hintText: "Customer Name")
              ],
            ),
          )


      ],),)),
    );
  }
}
