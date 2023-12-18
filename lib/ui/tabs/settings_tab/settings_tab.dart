
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:health360/utils/app_color.dart';
import 'package:provider/provider.dart';

import '../../../utils/providers/settings_provider.dart';

class SettingsTab extends StatelessWidget {
  static late SettingsProvider provider;
  static bool langSwitch = false;

  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsTab.provider = Provider.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Settings",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.normal),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                buildRow(
                    "Dark Mode",
                    provider.switchState,
                        (switchMode) => {
                      provider.setSwitchState(switchMode),
                      if (provider.switchState == true)
                        {provider.setCurrentMode(ThemeMode.dark)}
                      else
                        {provider.setCurrentMode(ThemeMode.light)}
                    },
                    context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildRow(String text, bool switchValue, Function(bool) onChanged,
      BuildContext context) {
    Color switchColor = provider.appMode == ThemeMode.light
        ? AppColor.primary
        : AppColor.darkAccent;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: provider.appMode == ThemeMode.light ? AppColor.black :
                AppColor.white, fontWeight: FontWeight.bold
          ),
        ),
        Switch(
          value: switchValue,
          onChanged: onChanged,
          activeColor: switchColor,
        )
      ],
    );
  }
}
