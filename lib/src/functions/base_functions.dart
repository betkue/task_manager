import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/src/utils/constant.dart';
import 'package:task_manager/src/utils/data.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

getDetailsOfDevice() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    internet = false;
  } else {
    internet = true;
  }
  try {
    pref = await SharedPreferences.getInstance();
  } catch (e) {
    if (e is SocketException) {
      internet = false;
    }
  }
}

getLocalData() async {
  //si l'application contient un token on recherche le user
  if (pref.containsKey('token')) {
    token = pref.getString('token');
    var response = await getUserDetails();
    return response;
  } else {
    return false;
  }
}

getUserDetails() async {
  dynamic result;

  try {
    if (internet) {
      //recuperation du user depuis le serveur

 
    } else {
      //recuperation du user en local
      userDetails = {'userName': "BTJH"};
      result = true;
    }
  } catch (e) {
    if (e is SocketException) {
      internet = false;
      result = false;
    }
  }
  return result;
}
