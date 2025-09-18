import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/text_styles.dart';

class CustomDropDown extends StatefulWidget {
  final String? value;
  final ValueChanged<String?>? onChanged;
  final String? errorText;
  const CustomDropDown({super.key, this.value, this.onChanged, this.errorText});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}
typedef MenuEntry = DropdownMenuEntry<String>;
class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    selectedValue = widget.value ;
    return  DropdownButtonFormField<String>(
      hint: Text("Choose the drink ",style: TextStyles.font14LightGrayMedium,),
      value: selectedValue,
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
        widget.onChanged?.call(value);
      },
        items: ['Shai', 'Turkish Coffee', 'Hibiscus Tea']
            .map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ))
            .toList(),
      decoration: InputDecoration(
        fillColor: ColorsManager.whiteGray,
        filled: true,
        contentPadding:
            EdgeInsets.symmetric(vertical: 17.h, horizontal: 20.w),
        enabledBorder:
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(
                color: ColorsManager.lighterGray,
                width: 1.w,
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
        focusedBorder:
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.r),
              borderSide: BorderSide(color: ColorsManager.mainBrown),
            ),
        errorText: widget.errorText,
      ),

    );
  }
}
