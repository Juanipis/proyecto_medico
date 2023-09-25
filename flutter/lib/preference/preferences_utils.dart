import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesUtils {
  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<bool> getBool(String key) async {
    final p = await prefs;
    return p.getBool(key) ?? false;
  }

  static Future setBool(String key, bool value) async {
    final p = await prefs;
    p.setBool(key, value);
  }

  static Future<String?> getString(String key) async {
    final p = await prefs;
    return p.getString(key);
  }

  static Future<void> setString(String key, String value) async {
    final p = await prefs;
    p.setString(key, value);
  }

  static Future<int?> getInt(String key) async {
    final p = await prefs;
    return p.getInt(key);
  }

  static Future<void> setInt(String key, int value) async {
    final p = await prefs;
    p.setInt(key, value);
  }
}
