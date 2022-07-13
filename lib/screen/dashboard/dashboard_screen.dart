// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autoproject/provider/dashboard_provider.dart';
import 'package:autoproject/screen/home/home_page_screen.dart';
import 'package:autoproject/screen/preferiti/preferiti_screen.dart';
import 'package:autoproject/utils/bottom_bar_screen.dart';
import 'package:autoproject/utils/my_theme.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/bottom_navigation_bar_provider.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({ Key? key }) : super(key: key);

  static const String routeName = "dashboard";
  final PageController controller = PageController(initialPage: 0);

  List<Widget> _widgetScreen = [
    HomePageScreen(),
    PreferitiScreen(),
    // PreferitiScreen()
  ];
  

  @override
  Widget build(BuildContext context) {

    var keyBoard = MediaQuery.of(context).viewInsets.bottom;
    print(keyBoard);

    return Scaffold(
      body: Consumer<DashboardProvider>(builder: (ctx, provider, _) {
        return Stack(
          children: [
            _widgetScreen[provider.index],
            // PageView(
            //   children: [
            //     HomePageScreen(),
            //     PreferitiScreen(),
            //     PreferitiScreen()
            //   ],
            //   controller: controller,
            //   onPageChanged: (int index) {
            //     provider.changeIndex(index);
            //   },
            // ),
            
            keyBoard == 0.0
            ?
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                child: Container(
                  child: CustomNavigationBar(
                    onTap: (index) {
                      provider.changeIndex(index);
                      // controller.jumpToPage(index);
                    },
                    currentIndex: provider.index,
                    iconSize: 30,
                    backgroundColor: MyTheme.primary,
                    borderRadius: Radius.circular(20),
                    strokeColor: MyTheme.secondary,
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.grey,
                    items: [
                      CustomNavigationBarItem(  
                        icon: Icon(Icons.home),
                        // title: Text("Home")
                      ),
                      CustomNavigationBarItem(  
                        icon: Icon(Icons.favorite),
                        // title: Text("Home")
                      ),
                      // CustomNavigationBarItem(  
                      //   icon: Icon(Icons.home),
                      //   // title: Text("Home")
                      // )
                    ],
                  )
                ),
              ),
            )
            :
            Container()
          ],
        );
      }),
    );
  }
}