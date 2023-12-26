import 'package:flutter/material.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/app_theme.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class BMIWidget extends StatelessWidget {
  final String bMIResult;
  final String title;

  const BMIWidget({super.key, required this.bMIResult, required this.title});

  @override
  Widget build(BuildContext context) {
    /// this widget is basic UI without any logic
    SettingsProvider provider = Provider.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: MediaQuery.of(context).size.height * 0.20,
      decoration: BoxDecoration(
        color: AppColor.liteGrey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(bMIResult,
              style: TextStyle(
                  fontSize: 20,
                  color: provider.appMode == ThemeMode.light?
                  AppColor.primary : AppColor.darkAccent,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
