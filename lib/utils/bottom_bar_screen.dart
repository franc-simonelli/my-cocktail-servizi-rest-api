// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autoproject/provider/bottom_navigation_bar_provider.dart';
import 'package:autoproject/utils/my_theme.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screen/home/home_page_screen.dart';
import '../screen/preferiti/preferiti_screen.dart';

class BottomBarScreen extends StatelessWidget {
  const BottomBarScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(builder: (ctx, provider, _) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
          child: Container(
            child: CustomNavigationBar(
              onTap: (index) {
                Provider.of<BottomNavigationBarProvider>(context, listen: false).setCurrentIndex(index);
              },
              currentIndex: provider.currentIndex,
              iconSize: 30,
              backgroundColor: MyTheme.primary,
              borderRadius: Radius.circular(20),
              selectedColor: Colors.white,
              unSelectedColor: Colors.grey,
              items: [
                CustomNavigationBarItem(  
                  icon: Icon(Icons.home),
                  // title: Text("Home")
                ),
                 CustomNavigationBarItem(  
                  icon: Icon(Icons.home),
                  // title: Text("Home")
                ),
                //  CustomNavigationBarItem(  
                //   icon: Icon(Icons.home),
                //   // title: Text("Home")
                // )
              ],
            )
          ),
        ),
      );
    });
  }
}