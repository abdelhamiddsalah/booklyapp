import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._(); // private constructor

  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    await _preferences?.remove(key);
  }

  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    await _preferences?.clear();
  }

  static Future<void> setData(String key, dynamic value) async {
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    if (_preferences == null) return;

    if (value is String) {
      await _preferences!.setString(key, value);
    } else if (value is int) {
      await _preferences!.setInt(key, value);
    } else if (value is bool) {
      await _preferences!.setBool(key, value);
    } else if (value is double) {
      await _preferences!.setDouble(key, value);
    } else {
      throw UnsupportedError('Type not supported');
    }
  }

  static String getString(String key, {String defaultValue = ''}) {
    debugPrint('SharedPrefHelper : getString with key : $key');
    return _preferences?.getString(key) ?? defaultValue;
  }

  static int getInt(String key, {int defaultValue = 0}) {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    return _preferences?.getInt(key) ?? defaultValue;
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    return _preferences?.getBool(key) ?? defaultValue;
  }

  static double getDouble(String key, {double defaultValue = 0.0}) {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    return _preferences?.getDouble(key) ?? defaultValue;
  }
}
