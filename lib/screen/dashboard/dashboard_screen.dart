// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, must_be_immutable


import 'package:autoproject/screen/settings/settings_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/dashboard_provider.dart';
import '../home/home_page_screen.dart';
import '../preferiti/preferiti_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({ Key? key }) : super(key: key);

  static const String routeName = "dashboard";
  final PageController controller = PageController(initialPage: 0);

  List<Widget> _widgetScreen = [
    HomePageScreen(),
    PreferitiScreen(),
    SettingsScreen()
  ];
  

  @override
  Widget build(BuildContext context) {

    var keyBoard = MediaQuery.of(context).viewInsets.bottom;

    return Scaffold(
      body: Consumer<DashboardProvider>(builder: (ctx, provider, _) {
        return Stack(
          children: [
            _widgetScreen[provider.index],
            
            keyBoard == 0.0
            ?
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
                child: Container(
                  decoration: BoxDecoration(
                    // color: MyTheme.theme.primaryColor,
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade500),
                    
                    // gradient: 
                    // provider.index == 0
                    // ?
                    // LinearGradient(
                    //   stops: [0.3, 0.9],
                    //     colors: [                          
                    //       Colors.grey.shade900,
                    //       Colors.grey.shade800
                    //     ]
                    // )
                    // :
                    // provider.index == 1
                    // ?
                    // LinearGradient(
                    //   stops: [0.3, 0.5, 0.9],
                    //     colors: [                          
                    //       Colors.grey.shade800,
                    //       Colors.grey.shade900,
                    //       Colors.grey.shade800,
                    //     ]
                    // )
                    // :
                    // LinearGradient(
                    //   stops: [0.3, 0.9],
                    //     colors: [                          
                    //       Colors.grey.shade800,
                    //       Colors.grey.shade900,
                    //     ]
                    // )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: CustomNavigationBar(
                      onTap: (index) {
                        provider.changeIndex(index);
                      },
                      currentIndex: provider.index,
                      iconSize: 30,
                      backgroundColor: Colors.transparent,
                      borderRadius: Radius.circular(20),
                      opacity: 0.5,
                      // strokeColor: MyTheme.theme.primaryColor,
                      strokeColor: Theme.of(context).primaryColor,
                      selectedColor: Colors.white,
                      unSelectedColor: Colors.grey.shade700,
                      items: [
                        CustomNavigationBarItem(  
                          icon: Icon(Icons.home),
                        ),
                        CustomNavigationBarItem(  
                          icon: Icon(Icons.favorite),
                        ),
                        CustomNavigationBarItem(  
                          icon: Icon(Icons.settings),
                        ),

                      ],
                    ),
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