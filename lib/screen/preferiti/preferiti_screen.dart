import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';

import '../../utils/bottom_bar_screen.dart';

class PreferitiScreen extends StatelessWidget {
  const PreferitiScreen({ Key? key }) : super(key: key);
  static const String routeName = "/preferiti";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.secondary,
      body: Center(child: Text("preferiti"),)
    );
  }
}