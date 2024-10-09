import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/src/pages/home.dart';
import 'package:task_manager/src/pages/loadingpage.dart';

void main() async {
  //fixer l'orientation de l'app
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          //supprimer le clavier en touchant l'ecran
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Task Master',
            theme: ThemeData(),
            home:  Home() // LoadingPage()
            ));
  }
}
