import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_color.dart';

class WeightAndAge extends StatelessWidget {
  final String type;
  final int age;
  final int weight;

  const WeightAndAge(
      {super.key, required this.type, required this.age, required this.weight});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: provider.appMode == ThemeMode.light
                ? AppColor.primary
                : AppColor.darkPrimary,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Expanded(
              child: Center(
                child: NumberPicker(
                  decoration: BoxDecoration(
                    border: Border.symmetric(horizontal: BorderSide(color: Theme.of(context).dividerColor, width: 2)),
                  ),
                    selectedTextStyle: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 26.sp),
                    textStyle: const TextStyle(color: AppColor.grey, fontSize: 15),
                    minValue: type == "Age" ? 5 : 10,
                    maxValue: type == "Age" ? 95 : 180,
                    value: type == "Age" ? age : weight,
                    onChanged: (value) => type == "Age"
                        ? provider.ageIncrement(value)
                        : provider.weightIncrement(value)),
              ),
            )
          ],
        ),
      ),
    );
  }
}