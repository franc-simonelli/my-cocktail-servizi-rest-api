// ignore_for_file: prefer_const_constructors

import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplahScreen extends StatelessWidget {
  const SplahScreen({ Key? key }) : super(key: key);
  static const String routeName = "/splashscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("contents/images/prova.jpg"), fit: BoxFit.cover,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text('D  R  I  N  K', style: MyTheme.theme.textTheme.titleLarge,)
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Align(
              alignment: Alignment.topCenter,
              child: Text('COCKTAIL', style: MyTheme.theme.textTheme.titleMedium)
            ),
          )
        ],
      )
    );
  }
}