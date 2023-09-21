import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  fontFamily: GoogleFonts.ubuntu().fontFamily,
  brightness: Brightness.dark,
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.deepOrange
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepOrange,
      foregroundColor: Colors.white
    )
  ),
  bottomAppBarTheme: const BottomAppBarTheme(
    color: Colors.black87
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 20),
    bodyMedium: TextStyle(fontSize: 18),
    labelLarge: TextStyle(fontWeight: FontWeight.bold),
    displayLarge: TextStyle(fontWeight: FontWeight.bold),
    titleMedium: TextStyle(color: Colors.grey),
  ),
);
