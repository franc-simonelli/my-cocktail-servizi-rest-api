// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:autoproject/screen/dashboard/dashboard_screen.dart';
import 'package:autoproject/screen/home/home_page_screen.dart';
import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../provider/home_page_provider.dart';

class SplahScreen extends StatelessWidget {
  const SplahScreen({ Key? key }) : super(key: key);
  static const String routeName = "/splashscreen";

  init(context)async {
    // Provider.of<HomeProvider>(context, listen: false).getAllIngredienti();
    late Timer timer;
    timer = Timer(
      Duration(seconds: 2),
          () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          )));
    // Navigator.of(context).pushNamed(HomePageScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {

    init(context);

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