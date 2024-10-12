import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/src/functions/base_functions.dart';
import 'package:task_manager/src/pages/home.dart';
import 'package:task_manager/src/pages/singnup.dart';
import 'package:task_manager/src/styles/styles.dart';
import 'package:task_manager/src/utils/sercive_provider.dart';

class AuthManager extends StatefulWidget {
  final ServiceProvider serv;
  const AuthManager({super.key, required this.serv});

  @override
  State<AuthManager> createState() => _AuthManagerState();
}

class _AuthManagerState extends State<AuthManager> {
  @override
  void initState() {
    initialisation();
    super.initState();
  }

  initialisation() async {
    //on verifi si l'appareil est connecte a internet
    var internet = await getDetailsOfDevice(context, widget.serv);
    widget.serv.toggleInternet(internet);
    //on charge les data

    //si l'utilisateur est connecte on ouvre la page d'acceuil
    if (widget.serv.userDetails.isNotEmpty) {
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                      serv: widget.serv,
                    )));
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
