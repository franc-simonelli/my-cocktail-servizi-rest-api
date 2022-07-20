import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {

  // static Color primary = Color.fromARGB(255, 30, 31, 37); 
  // static Color secondary = Color.fromARGB(255, 21, 21, 26); 
  static Color primary = Color.fromARGB(255, 29, 29, 29);
  static Color secondary =  Color.fromARGB(255, 17, 17, 17);
  static Color ingredienteCard = Color.fromARGB(255, 15, 15, 15);
  static Color cocktailCard = Color.fromARGB(255, 17, 17, 20);

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
      bodyMedium: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.grey, fontSize: 18, )),
      // headline1: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.black, fontSize: 16)),
    )
  );
  
}