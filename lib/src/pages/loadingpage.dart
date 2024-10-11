import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/src/functions/base_functions.dart';
import 'package:task_manager/src/pages/auth-manager.dart';
import 'package:task_manager/src/pages/home.dart';
import 'package:task_manager/src/pages/singnup.dart';
import 'package:task_manager/src/styles/styles.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:task_manager/src/utils/sercive_provider.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final serviceProvider = Provider.of<ServiceProvider>(context);
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
                child: AnimatedSplashScreen(
                    duration: 4000,
                    splashIconSize: media.width,
                    splash: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.all(media.width * 0.01),
                            width: media.width / 2,
                            height: media.width / 2,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/images/logo.png'),
                                    fit: BoxFit.contain)),
                          ),
                        ),
                      ],
                    ),
                    //verification de la connexion firebase
                    nextScreen: StreamBuilder<User?>(
                        stream: FirebaseAuth.instance.authStateChanges(),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? Home()
                              : AuthManager(
                                  serv: serviceProvider,
                                );
                        }))),
          ],
        ),
      ),
    );
  }
}
