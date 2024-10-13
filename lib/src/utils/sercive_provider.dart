import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/models/user.dart';
import 'package:task_manager/src/functions/base_functions.dart';
import 'package:task_manager/src/utils/constant.dart';

class ServiceProvider extends ChangeNotifier {
  bool internet = true;
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
    // _loadTaskFromPrefs();
    _loadUserFromPrefs();
  }

  void toggleTheme(bool isDark) {
    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    _saveThemeToPrefs(isDark);
    notifyListeners();
  }

  Future<void> logout() async {
    try {
      tasks = [];
      userDetails = {};
      await _pref!.clear();
    } catch (e) {
      internet = false;
    }
    notifyListeners();
  }

  void toggleInternet(bool value) {
    internet = value;
    notifyListeners();
  }

  Future<void> toggleUser(value) async {
    userDetails = value;
    userDetails['updateAt'] = DateTime.now().toString();
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userDetails['id'])
        .update(userDetails);
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
  }

  void toggleDeleteTasks(int index) {
    tasks.removeAt(index);
    _saveTaskToPrefs(tasks);
    notifyListeners();

    showToast("Task Delete");
  }

  void toggleUpdateTasks(Map<String, dynamic> value, int index) {
    tasks[index] = value;
    _saveTaskToPrefs(tasks);
    notifyListeners();

    showToast("Task Delete");
  }

  // Charger le thème depuis SharedPreferences
  void _loadThemeFromPrefs() async {
    bool isDark = false;
    isDark = _pref!.getBool('isDarkMode') ?? false;

    _saveThemeToPrefs(isDark);

    _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  // // Charger les tasks depuis SharedPreferences
  // void _loadTaskFromPrefs() async {
  //   var value = '[]';
  //   if (_pref!.containsKey('tasks')) {
  //     value = _pref!.getString('tasks')!;
  //   }
  //   tasks = List<dynamic>.from(jsonDecode(value));
  //   notifyListeners();
  // }

  Future<dynamic> saveUser() async {
    try {
      var userFire = await usersCollections
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      // toggleUser(userFire.data());
      Map<String, dynamic> user = userFire.data() as Map<String, dynamic>;

      if (userDetails.isEmpty) {
        tasks = user['tasks'];
        toggleUser(user);
      } else if (DateTime.parse(userDetails['updateAt'])
              .compareTo(DateTime.parse(user['updateAt'])) >
          0) {
        tasks = userDetails['tasks'];
        toggleUser(userDetails);
      } else {
        tasks = user['tasks'];
        toggleUser(user);
      }
    } catch (e) {
      internet = false;
    }
    notifyListeners();
  }

  // Charger les info du user depuis SharedPreferences
  void _loadUserFromPrefs() async {
    var value = '{}';
    if (_pref!.containsKey('user')) {
      value = _pref!.getString('user')!;
    } else {
      // value = jsonEncode(userDetails);
      _saveUsersToPrefs(userDetails);
    }

    userDetails = Map<String, dynamic>.from(jsonDecode(value));

    try {
      // //on charge l'utilisateur du serveur
      // var user = await usersCollections
      //     .withConverter(
      //         fromFirestore: Profile.fromFirestore,
      //         toFirestore: (Profile p, options) => p.toFirestore())
      //     .doc(FirebaseAuth.instance.currentUser?.uid)
      //     .get();

      // if (user.exists) {
      //   if (DateTime.parse(user.data()!.updateAt!)
      //           .compareTo(DateTime.parse(userDetails['updateAt'])) <
      //       0) {
      //     //derniere modification est locale
      //   } else {}
      // }
    } catch (e) {
      internet = false;
    }
    notifyListeners();
  }

  // Sauvegarder le thème dans SharedPreferences
  void _saveThemeToPrefs(bool isDark) async {
    await _pref!.setBool('isDarkMode', isDark);
  }

  // Sauvegarder le thème dans SharedPreferences
  void _saveTaskToPrefs(List<dynamic> tasks) async {
    try {
      userDetails['tasks'] = tasks;
      userDetails['updateAt'] = DateTime.now().toString();
      _saveUsersToPrefs(userDetails);
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userDetails['id'])
          .update(
              userDetails); //{'tasks': tasks, 'updateAt': DateTime.now().toString()}
    } catch (e) {
      internet = false;
    }

    // await _pref!.setString('tasks', jsonEncode(tasks));
    // _loadTaskFromPrefs();
  }

  // Sauvegarder le thème dans SharedPreferences
  void _saveUsersToPrefs(Map<String, dynamic> user) async {
    // user = await loadUser(user);
    await _pref!.setString('user', jsonEncode(user));
  }
}
