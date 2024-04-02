import 'package:flutter/material.dart';

import '../app_asset.dart';

class ProfileProvider extends ChangeNotifier {

  bool isAssetPath = true;
  String profileImagePath = AppAsset.avatar;

  void changeProfileImage(String newProfileImagePath) {
    isAssetPath = false;
    profileImagePath = newProfileImagePath;
    notifyListeners();
  }
}