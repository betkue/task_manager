import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceProvider extends ChangeNotifier {
  bool internet = false;
  dynamic pref;
  String token = '';
  dynamic userDetails = {'userName': "BTJH"};
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  ServiceProvider() {
    _loadThemeFromPrefs();
  }

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToPrefs(isDark);
    notifyListeners();
  }

  void toggleInternet(bool value) {
    internet = value;
    notifyListeners();
  }

  void toggleUser(value) {
    userDetails = value;
    notifyListeners();
  }

  void toggleToken(String value) {
    token = value;
    notifyListeners();
  }

  // Charger le thème depuis SharedPreferences
  void _loadThemeFromPrefs() async {
    pref = await SharedPreferences.getInstance();
    bool isDark = pref.getBool('isDarkMode') ?? false;
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // Sauvegarder le thème dans SharedPreferences
  void _saveThemeToPrefs(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDark);
  }
}
