import 'package:flutter/material.dart';

import '../../ui/tabs/community_tab/community_tab.dart';
import '../../ui/tabs/fitness_tab/fitness_tab.dart';
import '../../ui/tabs/home_tab/home_tab.dart';
import '../../ui/tabs/settings_tab/settings_tab.dart';

class TabsProvider extends ChangeNotifier{
  int currentTabIndex = 0;
  List<Widget> tabs = [
    const HomeTab(),
    const FitnessTab(),
    const CommunityTab(),
    const SettingsTab(),
  ];

  void setCurrentTabIndex(int index) {
    currentTabIndex = index;
    notifyListeners();
  }
  Widget navigateTab(int currentTabIndex, List<Widget> tabs) {
    return tabs[currentTabIndex];
  }
}
