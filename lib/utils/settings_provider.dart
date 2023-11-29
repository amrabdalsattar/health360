import 'package:flutter/material.dart';
import 'package:health360/utils/app_theme.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeData appMode = AppTheme.lightMode;

  void setMode(ThemeData newMode){
    appMode = newMode;
    notifyListeners();
}
}