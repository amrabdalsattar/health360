import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:health360/ui/tabs/community_tab/community_tab.dart';
import 'package:health360/ui/tabs/fitness_tab/fitness_tab.dart';
import 'package:health360/ui/tabs/settings_tab/settings_tab.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/models/post_model.dart';
import '../../ui/tabs/home_tab/home_tab.dart';
import '../app_asset.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsProvider extends ChangeNotifier {
  bool isAssetPath = true;
  String profileImagePath = AppAsset.avatar;

  void changeProfileImage(String newProfileImagePath) {
    isAssetPath = false;
    profileImagePath = newProfileImagePath;
    notifyListeners();
  }

  String breathworkStatus = "inhale".tr();

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
  void ageIncrement(int newAge){
    age = newAge;
    notifyListeners();
  }
  void weightIncrement(int newWeight){
    weight = newWeight;
    notifyListeners();
  }

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

  String postContent = "";

  void setPostContent(String text){
    postContent = text;
    notifyListeners();
  }

List<PostDM> posts = [];

  refreshPostsList() async {
    CollectionReference<PostDM> postsCollection = FirebaseFirestore.instance
        .collection("posts")
        .withConverter<PostDM>(fromFirestore: (docSnapShot, _) {
      Map json = docSnapShot.data() as Map;
      PostDM post = PostDM.fromJson(json);
      return post;
    }, toFirestore: (postDM, _) {
      return postDM.toJson();
    });

    QuerySnapshot<PostDM> postsSnapshot = await postsCollection
        .orderBy("date", descending: true)
        .get();

    List<QueryDocumentSnapshot<PostDM>> docs = postsSnapshot.docs;

    posts = docs.map((docSnapshot) {
      return docSnapshot.data();
    }).toList();

    notifyListeners();
  }

  ThemeMode appMode = ThemeMode.light;



  bool switchState = false;
  SharedPreferences? preferences;
  final String _themeKey = "theme";

  void setSwitchState(bool newSwitch){
    switchState = newSwitch;
    notifyListeners();
    saveSwitchState(newSwitch);
  }

  Future<void> saveSwitchState(bool newSwitch) async {
    String switchValue = (newSwitch == false ? "false" : "true");
    await preferences!.setString("switch", switchValue);
  }

  String? getSwitch() {
    return preferences!.getString("switch");
  }

  void setCurrentMode(ThemeMode newThemeMode) {
    appMode = newThemeMode;
    notifyListeners();
    saveTheme(newThemeMode);
  }

  Future<void> saveTheme(ThemeMode themeMode) async {
    String themeValue = (themeMode == ThemeMode.light ? "light" : "dark");
    await preferences!.setString(_themeKey, themeValue);
  }

  String? getTheme() {
    return preferences!.getString(_themeKey);
  }
  Future<void> loadConfig() async {
    preferences = await SharedPreferences.getInstance();
    String? themeMode = getTheme();
    String? switchStatus = getSwitch();

    if (themeMode != null) {
      appMode = (themeMode == "light" ? ThemeMode.light : ThemeMode.dark);
    }
    if (switchStatus != null) {
      switchState = (switchStatus == "false" ? false : true);
    }
    }
  }
