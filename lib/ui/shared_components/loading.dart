import 'package:flutter/material.dart';
import 'package:health360/utils/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/app_color.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider provider = Provider.of(context);
    return CircularProgressIndicator(
        color: provider.appMode == ThemeMode.light?
        AppColor.primary : AppColor.darkAccent,
    );
  }
}
