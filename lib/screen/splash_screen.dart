// ignore_for_file: prefer_const_constructors, unused_local_variable
import 'dart:async';
import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard/dashboard_screen.dart';

class SplahScreen extends StatelessWidget {
  const SplahScreen({ Key? key }) : super(key: key);
  static const String routeName = "/splashscreen";

  init(context)async {
    late Timer timer;
    timer = Timer(
      Duration(seconds: 2),
          () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          )));
  }

  initRepoPreferiti() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? preferiti = prefs.getStringList('preferiti');
    if(preferiti == null) {
      var list = [''];
      await prefs.setStringList('preferiti', list);
    }     
  }

  @override
  Widget build(BuildContext context) {

    init(context);
    initRepoPreferiti();

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