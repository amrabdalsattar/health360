import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class HeightSlider extends StatelessWidget {
  const HeightSlider({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.liteGrey
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(provider.heightValue.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 26.sp)),
                Text("cm", style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12),).tr(),
              ],
            ),
            Slider(
              divisions: 240,
              thumbColor: AppColor.white,
                activeColor: provider.appMode == ThemeMode.light ?
                AppColor.primary : AppColor.darkAccent,
                min: 90,
                max: 210,
                value: provider.heightValue,
                onChanged: (newValue) {
                  provider.sliderAutomator(newValue);
                })
          ],
        ),
      ),
    );
  }
}
