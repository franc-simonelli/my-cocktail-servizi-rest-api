// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {

  

  // static Color primary = Color.fromARGB(255, 30, 31, 37); 
  // static Color secondary = Color.fromARGB(255, 21, 21, 26); 
  static Color primary = Color.fromARGB(255, 29, 29, 29);
  static Color secondary =  Color.fromARGB(255, 17, 17, 17);
  static Color ingredienteCard = Color.fromARGB(255, 15, 15, 15);
  static Color cocktailCard = Color.fromARGB(255, 17, 17, 20);

  static LinearGradient gradientAppBar = LinearGradient(
    begin: Alignment.bottomRight,
    colors: [
      Colors.black,
      Colors.black.withOpacity(.3)
    ]
  );

  static LinearGradient gradientCocktail = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      MyTheme.primary,
      MyTheme.cocktailCard,
    ], 
  );

  static LinearGradient gradientIngrediente = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      MyTheme.primary,
      Color.fromARGB(255, 20, 20, 20)
    ], 
  );

  static List<BoxShadow> shadowCardPreferiti = [
    BoxShadow(
      blurRadius: 2,
      offset: Offset(-3, -3),
      color: Colors.grey.shade800
    ),
    BoxShadow(
      blurRadius: 2,
      offset: Offset(3, 3),
      color: Colors.black
    )
  ];

  static List<BoxShadow> shadowCocktail = [
    BoxShadow(
      blurRadius: 2,
      offset: Offset(-3, -3),
      color: Colors.grey.shade800
    ),
    BoxShadow(
      blurRadius: 2,
      offset: Offset(3, 3),
      color: Colors.black
    )
  ];

  static List<BoxShadow> shadowIngrediente = [
    BoxShadow(
      blurRadius: 1,
      offset: Offset(-2, -2),
      color: Colors.grey.shade900
    ),
    BoxShadow(
      blurRadius: 1,
      offset: Offset(2, 2),
      color: Colors.black
    )
  ];


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