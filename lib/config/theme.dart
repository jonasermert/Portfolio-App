import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  static final ValueNotifier<ThemeMode> themeNotifier =
      ValueNotifier(ThemeMode.system);

  static ThemeData lightTheme = ThemeData.light();
  static ThemeData darkTheme = ThemeData.dark();

  static Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('themeMode');

    if (theme == 'light') {
      themeNotifier.value = ThemeMode.light;
    } else if (theme == 'dark') {
      themeNotifier.value = ThemeMode.dark;
    } else {
      themeNotifier.value = ThemeMode.system;
    }
  }

  static Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (themeNotifier.value == ThemeMode.dark) {
      themeNotifier.value = ThemeMode.light;
      await prefs.setString('themeMode', 'light');
    } else {
      themeNotifier.value = ThemeMode.dark;
      await prefs.setString('themeMode', 'dark');
    }
  }
}
