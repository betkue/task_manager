import 'package:flutter/material.dart';

const Color gray2Color = Color(0xFF909090);
const Color backgroundPage = grayColor;
const Color redColor = Color(0xFFfe3131);
const Color orangeColor = Color.fromARGB(255, 240, 128, 37);
const Color grayColor = Color(0xFFf5f5f5);
const Color blueColor = Color(0xFF1a62a8);
const Color greenColor = Color(0xFF83bf3f);
const Color blackColor = Color.fromARGB(255, 19, 19, 19);
class LightColors {
  static const Color gray2Color = Color(0xFF909090); // Gray 2 pour le mode clair
  static const Color background = grayColor;
  static const Color primary = blueColor;
  static const Color secondary = greenColor;
  static const Color accent = orangeColor;
  static const Color error = redColor;
  static const Color textPrimary = Colors.black;
  static const Color textSecondary = Colors.black54;
}

// Couleurs pour le mode sombre
class DarkColors {
  static const Color gray2Color = Color(0xFFB0B0B0); // Gray 2 différent pour le mode sombre
  static const Color background = Color(0xFF303030); // Un gris foncé
  static const Color primary = Color(0xFF1a62a8); // Même bleu que le mode clair
  static const Color secondary = Color(0xFF83bf3f); // Même vert que le mode clair
  static const Color accent = Color(0xFFf57c00); // Une couleur d'accent différente
  static const Color error = Color(0xFFcf6679); // Une couleur d'erreur
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
}
