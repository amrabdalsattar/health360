import 'package:flutter/material.dart';
import 'package:health360/utils/app_color.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class BodyCompositionAppBar extends StatelessWidget {
  final String title;

  const BodyCompositionAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return AppBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: provider.appMode == ThemeMode.light
          ? AppColor.grey
          : AppColor.darkPrimary,
      title: Text(title),
      centerTitle: true,
      elevation: 0,
    );
  }
}
