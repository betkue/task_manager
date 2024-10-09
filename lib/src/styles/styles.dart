import 'package:flutter/material.dart';

const Color gray2Color = Color(0xFF909090);
const Color backgroundPage = grayColor;
const Color redColor = Color(0xFFfe3131);
const Color orangeColor = Color.fromARGB(255, 240, 128, 37);
const Color grayColor = Color(0xFFf5f5f5);
const Color blueColor = Color(0xFF1a62a8);
const Color greenColor = Color(0xFF83bf3f);
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.light(
    primary: Colors.blue,
    secondary: Colors.green,
    surface: Colors.white,
    background: Colors.white,
    onPrimary: Colors.white, // Texte sur les boutons ou AppBars
    onSecondary: Colors.black, // Texte sur les boutons secondaires
  ),
  scaffoldBackgroundColor: Colors.white,
  // Autres personnalisations...
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.dark(
    primary: Colors.blueAccent,
    secondary: Colors.purple,
    surface: Colors.black,
    background: Colors.black87,
    onPrimary: Colors.black,
    onSecondary: Colors.white,
  ),
  scaffoldBackgroundColor: Colors.black87,
  // Autres personnalisations...
);
