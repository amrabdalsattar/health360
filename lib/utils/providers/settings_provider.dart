import 'package:flutter/material.dart';
import 'package:health360/ui/tabs/community_tab/community_tab.dart';
import 'package:health360/ui/tabs/fitness_tab/fitness_tab.dart';
import 'package:health360/ui/tabs/settings_tab/settings_tab.dart';
import 'package:health360/utils/app_theme.dart';
import 'package:health360/utils/providers/main_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ui/tabs/home_tab/home_tab.dart';
import '../app_asset.dart';

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

  Widget navigateTab(int currentTabIndex, List<Widget> tabs) {
    return tabs[currentTabIndex];
  }

  bool isAssetPath = true;
  String profileImagePath = AppAsset.avatar;

  void changeProfileImage(String newProfileImagePath) {
    isAssetPath = false;
    profileImagePath = newProfileImagePath;
    notifyListeners();
  }

  String breathworkStatus = "Inhale";

  void changeBreathworkStatus(String status) {
    breathworkStatus = status;
    notifyListeners();
  }

  bool isMale = true;

  setGender(bool gender) {
    isMale = gender;
    notifyListeners();
  }

  int age = 18;
  int weight = 55;
  double heightValue = 170;

  void sliderAutomator(double newValue) {
    heightValue = newValue;
    notifyListeners();
  }

  void incrementAge() {
    age++;
    notifyListeners();
  }

  void decrementAge() {
    age--;
    notifyListeners();
  }

  void incrementWeight() {
    weight++;
    notifyListeners();
  }

  void decrementWeight() {
    weight--;
    notifyListeners();
  }

  SharedPreferences? _preferences;
  Future<void> loadConfig() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
