// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autoproject/models/ingredienti_model.dart';
import 'package:autoproject/provider/bottom_navigation_bar_provider.dart';
import 'package:autoproject/provider/home_page_provider.dart';
import 'package:autoproject/screen/home/all_cocktail_screen.dart';
import 'package:autoproject/screen/home/search_cocktails_screen.dart';
import 'package:autoproject/screen/home/widget/ingrediente_widget.dart';
import 'package:autoproject/screen/preferiti/preferiti_screen.dart';
import 'package:autoproject/utils/constants.dart';
import 'package:autoproject/utils/my_theme.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../utils/bottom_bar_screen.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({ Key? key }) : super(key: key);
  static const String routeName = "/home";


  @override
  Widget build(BuildContext context) {

    var keyBoard = MediaQuery.of(context).viewInsets.bottom;
    Provider.of<HomeProvider>(context, listen: false).getAllIngredienti();
    print("key: $keyBoard");
    return Scaffold(
      body: Consumer2<HomeProvider, BottomNavigationBarProvider>(builder: (ctx, provider, provdier2, _) {
        return LayoutBuilder(
          builder: (context, constraint) {
            return Stack(
              children: [

                SingleChildScrollView(  
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                SizedBox(height: 70,),
                                titleWidget(),
                                searchCocktailWidget(context),
                                SizedBox(height: 10),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: scrollsWidget(provider),
                          ),
                      
                          
                        ]
                      )
                    )
                  ),
                ),
                
                // keyBoard == 0.0
                // ?
                // BottomBarScreen()
                // :
                // Container()
              ]
            );
          }
        );
      }),
    );
  }

  Widget scrollsWidget(HomeProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: MyTheme.secondary,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Text('Basi alcoliche principali', style: MyTheme.theme.textTheme.titleSmall,)
              ],
            ),
          ),
          basiAlcolicheWidget(provider),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ingredienti', style: MyTheme.theme.textTheme.titleSmall,),
                Text('View all', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),)
                // Icon(Icons.slideshow_outline, color: Colors.grey,)
              ],
            ),
          ),
          ingredientiWidget(provider),
        ],
      ),
    );
  }

  Widget ingredientiWidget(HomeProvider provider) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.listaIngredienti.length,
        itemBuilder: (context, i){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                provider.getDrinkByIngrediente(provider.listaIngredienti[i]);
                Navigator.of(context).pushNamed(AllCocktailScreen.routeName);
              },
              child: IngredienteWidget(provider.listaIngredienti[i])
            ),
          );
        }
          
      ),
    );
  }

  Widget basiAlcolicheWidget(HomeProvider provider) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.basiAlcoliche.length,
        itemBuilder: (context, i){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                provider.getDrinkByIngrediente(provider.basiAlcoliche[i]);
                Navigator.of(context).pushNamed(AllCocktailScreen.routeName);
              },
              child: IngredienteWidget(provider.basiAlcoliche[i]),
            ),
          );
        }
          
      ),
    );
  }

  Widget searchCocktailWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
        onTap: () {
          Provider.of<HomeProvider>(context, listen: false).initSearch();
          Navigator.of(context).pushNamed(SearchCocktailScreen.routeName);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: MyTheme.primary,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(   
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Name a Cocktail?", style: GoogleFonts.josefinSans(color: Colors.grey, fontSize: 17),),
                Icon(Icons.search, color: Colors.grey,),
              ],
            ),
          )
          // child: TextField(  
          //   cursorColor: Color.fromARGB(255, 21, 21, 26),
          //   style: TextStyle(fontSize: 18),
            
          //   decoration: InputDecoration(
          //     suffixIcon: Icon(Icons.search, color: Colors.grey,),
          //     contentPadding: EdgeInsets.all(15),
          //     hintText: 'Name a Cocktail?',
          //     hintStyle: GoogleFonts.josefinSans(color: Colors.grey, fontSize: 17),
          //     border: InputBorder.none,
          //     focusedBorder: InputBorder.none,
          //     enabledBorder: InputBorder.none,
          //     errorBorder: InputBorder.none,
          //     disabledBorder: InputBorder.none,
          //   ),
          // ),
        ),
      ),
    );
  }

  Widget titleWidget() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("The best", style: MyTheme.theme.textTheme.titleMedium),
                Text('cocktail guide', style: MyTheme.theme.textTheme.titleMedium)
              ],
            ),
            Container(
              width: 70,
              height: 70,
              child: Image.asset('contents/images/logo.png',  color: Colors.grey,)
            )
          ],
        ),
      ),
    );
  }
}


