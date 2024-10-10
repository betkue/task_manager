import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/src/functions/base_functions.dart';

class ServiceProvider extends ChangeNotifier {
  bool internet = false;
  SharedPreferences? _pref;
  String token = '';
  Map<String, dynamic> userDetails = {};
  ThemeMode _themeMode = ThemeMode.light;
  List<dynamic> tasks = []; // Liste des tâches
  Map<String, dynamic> task = {};
  ThemeMode get themeMode => _themeMode;

  ServiceProvider() {
    _initializePrefs();
  }
  Future<void> _initializePrefs() async {
    _pref =
        await SharedPreferences.getInstance(); // Initialiser SharedPreferences
    _loadThemeFromPrefs();
    _loadTaskFromPrefs();
    _loadUserFromPrefs();
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
    _saveUsersToPrefs(userDetails);
    notifyListeners();
  }

  void toggleToken(String value) {
    token = value;
    notifyListeners();
  }

  void toggleTasks(List<dynamic> value) {
    tasks = value;
    _saveTaskToPrefs(tasks);
    notifyListeners();
    showToast("Tasks add");
  }

  void toggleAddTasks(Map<String, dynamic> value) {
    tasks.insert(0, value);
    _saveTaskToPrefs(tasks);
    notifyListeners();

    showToast("Task add");
    log(tasks.toString());
  }

  void toggleDeleteTasks(int index) {
    tasks.removeAt(index);
    _saveTaskToPrefs(tasks);
    notifyListeners();

    showToast("Task Delete");
    log(tasks.toString());
  }

  void toggleUpdateTasks(Map<String, dynamic> value, int index) {
    tasks[index] = value;
    _saveTaskToPrefs(tasks);
    notifyListeners();

    showToast("Task Delete");
    log(tasks.toString());
  }

  // Charger le thème depuis SharedPreferences
  void _loadThemeFromPrefs() async {
    bool isDark = false;
    isDark = _pref!.getBool('isDarkMode') ?? false;

    _saveThemeToPrefs(isDark);

    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // Charger les tasks depuis SharedPreferences
  void _loadTaskFromPrefs() async {
    var value;
    if (_pref!.containsKey('tasks')) {
      value = _pref!.getString('tasks');
    } else {
      value = '[]';
      _saveTaskToPrefs(jsonDecode(value));
    }
    tasks = List<dynamic>.from(jsonDecode(value));
    log(tasks.toString());
    notifyListeners();
  }

  // Charger les info du user depuis SharedPreferences
  void _loadUserFromPrefs() async {
    var value;
    if (_pref!.containsKey('user')) {
      value = _pref!.getString('user');
    } else {
      value = jsonEncode(userDetails);
      _saveUsersToPrefs(jsonDecode(value));
    }

    userDetails = Map<String, dynamic>.from(jsonDecode(value));

    log(userDetails.toString());
    notifyListeners();
  }

  // Sauvegarder le thème dans SharedPreferences
  void _saveThemeToPrefs(bool isDark) async {
    await _pref!.setBool('isDarkMode', isDark);
  }

  // Sauvegarder le thème dans SharedPreferences
  void _saveTaskToPrefs(List<dynamic> tasks) async {
    await _pref!.setString('tasks', jsonEncode(tasks));
  }

  // Sauvegarder le thème dans SharedPreferences
  void _saveUsersToPrefs(Map<String, dynamic> user) async {
    await _pref!.setString('user', jsonEncode(user));
  }
}
