import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_manager/src/functions/base_functions.dart';
import 'package:task_manager/src/pages/home.dart';
import 'package:task_manager/src/pages/singnup.dart';
import 'package:task_manager/src/styles/styles.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    //on verifi les divers etats
    initialisation();

    super.initState();
  }

  initialisation() async {
    //on verifi si l'appareil est connecte a internet
    await getDetailsOfDevice();
    //on charge les data
    var result = await getLocalData();

    //si l'utilisateur est connecte on ouvre la page d'acceuil
    if (result) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) =>  Home()));
      });
    }
    //sinon on l'authentifie
    else {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const SignUp()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Material(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: media.height * 1,
              width: media.width * 1,
              decoration: const BoxDecoration(
                color: backgroundPage,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(media.width * 0.01),
                    width: media.width * 0.429,
                    height: media.width * 0.429,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/logo.png'),
                            fit: BoxFit.contain)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
