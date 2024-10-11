import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_manager/firebase_options.dart';
import 'package:task_manager/src/pages/home.dart';
import 'package:task_manager/src/pages/loadingpage.dart';
import 'package:task_manager/src/utils/sercive_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  //fixer l'orientation de l'app
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
 runApp(
    ChangeNotifierProvider(
      create: (context) => ServiceProvider(),
      child: MyApp(),
    ),
  );
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
        child: Consumer<ServiceProvider>(
      builder: (context, serviceProvider, child) {
        return MaterialApp(
          title: 'Task Master',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(), // Thème clair
          darkTheme: ThemeData.dark(), // Thème sombre
          themeMode: serviceProvider.themeMode, // Mode de thème
          home: const LoadingPage(),
        );
      },
    ));
  }
}
