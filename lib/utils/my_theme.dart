import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {

  static Color primary = Color.fromARGB(255, 30, 31, 37); 
  static Color secondary = Color.fromARGB(255, 21, 21, 26); 

  static ThemeData theme = ThemeData(
    // fontFamily: 'RobotoMono',
    backgroundColor: primary,
    scaffoldBackgroundColor: primary,

    textTheme: TextTheme(
      titleLarge: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.grey, fontSize: 40)),
      titleMedium: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.grey, fontSize: 35)),
      titleSmall: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold)),
      headlineSmall: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.grey, fontSize: 16, )),
      labelSmall: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold)),
      // headline1: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.black, fontSize: 16)),
    )
  );
  
}