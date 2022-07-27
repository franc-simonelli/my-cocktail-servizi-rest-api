// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autoproject/screen/home/all_ingredienti/view_all_ingredienti_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../provider/bottom_navigation_bar_provider.dart';
import '../../provider/dashboard_provider.dart';
import '../../provider/drink_provider.dart';
import '../../provider/ingredienti_provider.dart';
import '../../utils/my_theme.dart';
import 'all_cocktail/all_cocktail_screen.dart';
import 'search_cocktails_screen.dart';
import 'widget/ingrediente_widget.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({ Key? key }) : super(key: key);
  static const String routeName = "/home";


  @override
  Widget build(BuildContext context) {

    Provider.of<IngredientiProvider>(context, listen: false).getAllIngredienti();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Consumer2<IngredientiProvider, BottomNavigationBarProvider>(builder: (ctx, provider, provdier2, _) {
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
                            child: Container( 
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(0),
                                color: Colors.black,
                                image: DecorationImage(
                                  image: AssetImage('contents/images/prova.jpg'),
                                  opacity: 0.8,
                                  fit: BoxFit.cover
                                ),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(height: 70,),
                                  titleWidget(context),
                                  searchCocktailWidget(context),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: scrollsWidget(provider, context)
                            ),
                          ), 
                             
                        ]
                      )
                    )
                  ),
                ),
              ]
            );
          }
        );
      }),
    );
  }

  Widget scrollsWidget(IngredientiProvider provider, context) {

    // var brightness = SchedulerBinding.instance.window.platformBrightness;
    // bool isLightMode = brightness == Brightness.light ? true : false;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: Column(
        children: [
          SizedBox(height: 5),
          titleBasiWidget(context),
          provider.ingredientiPreferiti.isEmpty
          ?
          SizedBox(
            height: 175,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: MyTheme.gradientIngrediente,
                      boxShadow: MyTheme.shadowIngrediente
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Provider.of<DashboardProvider>(context, listen: false).changeIndex(2);
                        },
                        child: Icon(Icons.add_circle_sharp, color: Colors.grey, size: 40,)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          :
          basiAlcolicheWidget(provider),
          titleIngredientiWidget(context),
          ingredientiWidget(provider),
        ],
      ),
    );
  }

  Widget titleIngredientiWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Ingredienti', style: Theme.of(context).textTheme.titleSmall,),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(ViewAllIngredientiScreen.routeName);
            },
            child: Container(
              width: 70,
              height: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey)
              ),
              
              child: Center(child: Text('View all', style: TextStyle(color: Colors.grey,  fontSize: 15),)),
            ),
          )
          
          // Icon(Icons.slideshow_outline, color: Colors.grey,)
        ],
      ),
    );
  }

  Widget titleBasiWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Ingredienti preferiti', style: Theme.of(context).textTheme.titleSmall,),
          Container(
            width: 80,
            height: 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)
            ),
            
            child: Center(
              child: InkWell(
                onTap: () {
                  _showDialogEliminaIngredienti(context);
                  // Provider.of<IngredientiProvider>(context, listen: false).deleteAllBasiPreferite();
                },                      
                child: Text('Delete All', style: TextStyle(color: Colors.grey,  fontSize: 15),))
            ),
          )
        ],
      ),
    );
  }

  Widget ingredientiWidget(IngredientiProvider provider) {
    return SizedBox(
      height: 165,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.ingredienti.length,
        itemBuilder: (context, i){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                Provider.of<DrinkProvider>(context, listen: false).getDrinkByIngrediente(provider.ingredienti[i]);
                Navigator.of(context).pushNamed(AllCocktailScreen.routeName);
              },
              child: IngredienteWidget(provider.ingredienti[i], 80.0, 80.0, false)
            ),
          );
        }
          
      ),
    );
  }

  Widget basiAlcolicheWidget(IngredientiProvider provider) {
    return SizedBox(
      height: 175,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: provider.ingredientiPreferiti.length,
        itemBuilder: (context, i){
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                Provider.of<DrinkProvider>(context, listen: false).getDrinkByIngrediente(provider.ingredientiPreferiti[i]);
                Navigator.of(context).pushNamed(AllCocktailScreen.routeName);
              },
              child: IngredienteWidget(provider.ingredientiPreferiti[i], 80.0, 80.0, false),
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
          Provider.of<DrinkProvider>(context, listen: false).initSearch();
          Navigator.of(context).pushNamed(SearchCocktailScreen.routeName);
        },
        child: Container(
          
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Theme.of(context).splashColor.withOpacity(0.8),
            // color: Colors.transparent,
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
        ),
      ),
    );
  }

  Widget titleWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("The best", style: Theme.of(context).textTheme.titleMedium),
              Text('cocktail guide', style: Theme.of(context).textTheme.titleMedium)
            ],
          ),
          SizedBox(
            width: 70,
            height: 70,
            child: Image.asset('contents/images/logo.png',  color: Colors.grey,)
          )
        ],
      ),
    );
  }

  Future<void> _showDialogEliminaIngredienti(context) async {
  return showDialog<void>(
    
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).splashColor,
        title: Text('Attenzione', style: Theme.of(context).textTheme.titleMedium,),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Sei sicuro di voler eliminare i tuoi ingredienti preferiti?', style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Annulla', style: TextStyle(color: Colors.grey),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Conferma', style: TextStyle(color: Colors.grey)),
            onPressed: () {
              Provider.of<IngredientiProvider>(context, listen: false).deleteAllBasiPreferite();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

}


