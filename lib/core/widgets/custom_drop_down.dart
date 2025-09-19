import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../features/home/data/models/drink.dart';
import '../theming/colors.dart';
import '../theming/text_styles.dart';
String drinkLabel(DrinkType type) {
  switch (type) {
    case DrinkType.shai:
      return 'Shai (Tea)';
    case DrinkType.turkishCoffee:
      return 'Turkish Coffee';
    case DrinkType.hibiscusTea:
      return 'Hibiscus Tea (Karkadeh)';
  }
}
class CustomDropDown extends StatefulWidget {
  final DrinkType selectedDrink;
  final ValueChanged<DrinkType?>? onChanged;

  const CustomDropDown({super.key, required this.selectedDrink, this.onChanged});
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _CustomDropDownState extends State<CustomDropDown> {


  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<DrinkType>(
      hint: Text("Choose the drink ", style: TextStyles.font14LightGrayMedium),
      value: widget.selectedDrink,
      onChanged: (v) {
        if (widget.onChanged != null) widget.onChanged!(v);
        // Keep internal setState minimal to reflect external controlled value if needed
        setState(() {});
      },

      items: [
        for (final type in DrinkType.values)
          DropdownMenuItem(value: type, child: Text(drinkLabel(type))),
      ],
      decoration: InputDecoration(
        fillColor: ColorsManager.whiteGray,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 20.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.lighterGray, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: Colors.red.shade900, width: 1.w),
        ),
        errorStyle: TextStyle(color: Colors.red.shade900),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(color: ColorsManager.mainBrown),
        ),
      ),
    );
  }
}
