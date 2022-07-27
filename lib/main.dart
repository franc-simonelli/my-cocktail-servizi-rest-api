

// ignore_for_file: prefer_const_constructors, equal_keys_in_map

import 'package:autoproject/provider/bottom_navigation_bar_provider.dart';
import 'package:autoproject/provider/dashboard_provider.dart';
import 'package:autoproject/provider/drink_provider.dart';
import 'package:autoproject/provider/ingredienti_provider.dart';
import 'package:autoproject/provider/preferiti_provider.dart';
import 'package:autoproject/screen/dashboard/dashboard_screen.dart';
import 'package:autoproject/screen/home/all_cocktail/all_cocktail_screen.dart';
import 'package:autoproject/screen/home/dettaglio_screen/detail_cocktail_screen.dart';
import 'package:autoproject/screen/home/home_page_screen.dart';
import 'package:autoproject/screen/home/search_cocktails_screen.dart';
import 'package:autoproject/screen/home/all_ingredienti/view_all_ingredienti_screen.dart';
import 'package:autoproject/screen/preferiti/preferiti_screen.dart';
import 'package:autoproject/screen/settings/settings_screen.dart';
import 'package:autoproject/screen/splash_screen.dart';
import 'package:autoproject/services/drink_service.dart';
import 'package:autoproject/services/http_service.dart';
import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:provider/provider.dart';

void main() {
  
  ModuleContainer().initialise(Injector());

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DrinkProvider(),),
        ChangeNotifierProvider(create: (_) => IngredientiProvider(),),
        ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider(),),
        ChangeNotifierProvider(create: (_) => DashboardProvider(),),
        ChangeNotifierProvider(create: (_) => PreferitiProvider(),),
      ],
      child: MyApp(),
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: MyTheme.themeDark.primaryColor
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyTheme.themeDark,
      // darkTheme: MyTheme.themeDark,
      initialRoute: SplahScreen.routeName,
      routes: createRoutes(),
    );
  }
}

class ModuleContainer {
  Injector initialise(Injector injector) {
    injector.map<HttpService>((i) => HttpService(), isSingleton: false);
    injector.map<DrinkService>((i) => DrinkService(), isSingleton: false);

    return injector;
  }
}

Map<String, Widget Function(BuildContext)> createRoutes() {
  return {
    HomePageScreen.routeName: (ctx) => HomePageScreen(),  
    PreferitiScreen.routeName: (ctx) => PreferitiScreen(),
    SplahScreen.routeName: (ctx) => SplahScreen(),
    DashboardScreen.routeName: (ctx) => DashboardScreen(),
    AllCocktailScreen.routeName: (ctx) => AllCocktailScreen(),
    DetailsCocktailScreen.routeName: (ctx) => DetailsCocktailScreen(),
    SearchCocktailScreen.routeName: (ctx) => SearchCocktailScreen(),
    SettingsScreen.routeName: (ctx) => SettingsScreen(),
    ViewAllIngredientiScreen.routeName: (ctx) => ViewAllIngredientiScreen(),
  };
}