import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/src/styles/styles.dart';
import 'package:task_manager/src/utils/constant.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager/src/utils/sercive_provider.dart';

//test de connectivite
getDetailsOfDevice(context) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  final serviceProvider = Provider.of<ServiceProvider>(context); // provider
  if (connectivityResult == ConnectivityResult.none) {
    serviceProvider.toggleInternet(false);
  } else {
    serviceProvider.toggleInternet(true);
  }
}

getLocalData(context) async {
  //si l'application contient un token on recherche le user
  final serviceProvider = Provider.of<ServiceProvider>(context); // provider

  // if (serviceProvider.pref.containsKey('token')) {
  //   serviceProvider.toggleToken(serviceProvider.pref.getString('token') ?? "");
  //   var response = await getUserDetails(context);
  //   return response;
  // } else {
  //   return false;
  // }
}

getUserDetails(context) async {
  dynamic result;
  final serviceProvider = Provider.of<ServiceProvider>(context); // provider

  try {
    if (serviceProvider.internet) {
      //recuperation du user depuis le serveur
    } else {
      //recuperation du user en local
      serviceProvider.toggleUser({});
      result = true;
    }
  } catch (e) {
    if (e is SocketException) {
      serviceProvider.toggleInternet(false);
      result = false;
    }
  }
  return result;
}

showToast(String message,
    {Color bgColor = greenColor, textColor = Colors.white, duration = 5}) {
  // if(bgColor == null){
  //   bgColor = Colors.red;
  // }
  // if(textColor == null){
  //   textColor = Colors.white;
  // }
  return Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: duration,
    backgroundColor: bgColor,
    textColor: textColor,
    fontSize: 12.0,
  );
}
