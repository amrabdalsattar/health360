import 'package:flutter/material.dart';
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
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold),),
                const Text("CM", style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500),),
              ],
            ),
            Slider(
              divisions: 240,
              thumbColor: AppColor.black,
                activeColor: AppColor.primary,
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
