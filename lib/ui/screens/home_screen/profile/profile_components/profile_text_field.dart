import 'package:flutter/material.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/app_color.dart';

class ProfileTextField extends StatelessWidget {
  final String text;
  const ProfileTextField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return TextField(
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColor.primary, width: 2.0),
          borderRadius: BorderRadius.all(
            Radius.circular(
              30.0,
            ),
          ),
        ),
        fillColor: provider.appMode == ThemeMode.light?
      AppColor.liteGrey : AppColor.darkPrimary,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        labelText: text
      ),
      enabled: false,

    );
  }
}
