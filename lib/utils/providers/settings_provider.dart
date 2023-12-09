import 'package:flutter/material.dart';
import 'package:health360/ui/tabs/community_tab/community_tab.dart';
import 'package:health360/ui/tabs/fitness_tab/fitness_tab.dart';
import 'package:health360/ui/tabs/settings_tab/settings_tab.dart';
import 'package:health360/utils/app_theme.dart';
import 'package:health360/utils/providers/main_provider.dart';

import '../../ui/tabs/home_tab/home_tab.dart';

class SettingsProvider extends MainProvider {
  int currentTabIndex = 0;
  ThemeData appMode = AppTheme.lightMode;
  List<Widget> tabs = [
    const HomeTab(),
    const FitnessTab(),
    const CommunityTab(),
    const SettingsTab(),
  ];

  void setMode(ThemeData newMode) {
    appMode = newMode;
    notifyListeners();
  }

  void setCurrentTabIndex(int index) {
    currentTabIndex = index;
    notifyListeners();
  }

  Widget navigateTab(int currentTabIndex, List<Widget> tabs){
    return tabs[currentTabIndex];
  }
}
