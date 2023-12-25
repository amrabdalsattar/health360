import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences sharedPreferences;

  static void cacheInitialization() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  /// setter
  static Future<bool> setData({required String key, required dynamic value}) async {
    if (value is String) {
      await sharedPreferences.setString(key, value);
      return true;
    }
    if (value is bool) {
      await sharedPreferences.setBool(key, value);
      return true;
    }
    if (value is int) {
      await sharedPreferences.setInt(key, value);
      return true;
    }
    if (value is double) {
      await sharedPreferences.setDouble(key, value);
      return true;
    }
    return false;
  }

  /// getter
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  /// remover
  static void removeData({required String key}) {
    sharedPreferences.remove(key);
  }
}
