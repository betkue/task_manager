import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/src/pages/singnup.dart';
import 'package:task_manager/src/styles/styles.dart';
import 'package:task_manager/src/utils/constant.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_manager/src/utils/sercive_provider.dart';

//test de connectivite
// getDetailsOfDevice(context, serviceProvider) async {
//   var connectivityResult = await (Connectivity().checkConnectivity());

//   try {
//     if (connectivityResult == ConnectivityResult.none) {
//       serviceProvider.toggleInternet(false);
//       return true;
//     } else {
//       serviceProvider.toggleInternet(true);
//       return false;
//     }
//   } catch (e) {
//     serviceProvider.toggleInternet(true);
//     log(e.toString());
//     return false;
//   }
// }

showToast(String message,
    {Color bgColor = greenColor, textColor = Colors.white, duration = 5}) {
  // if(bgColor == null){
  //   bgColor = Colors.red;
  // }
  // if(textColor == null){
  //   textColor = Colors.white;
  // }
  //   ScaffoldMessenger.of(context).showSnackBar(
  //   SnackBar(content: Text('${widget.task['title']} supprimé')),
  // );
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

logout(context, serviceProvider) async {
  try {
    if (serviceProvider.internet) {
      await FirebaseAuth.instance.signOut();
      await serviceProvider.logout();
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const SignUp()));
      });
    }
  } catch (e) {
    serviceProvider.
    log(e.toString());
  }
}
