
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/drink_provider.dart';
import '../../utils/my_theme.dart';
import 'dettaglio_screen/detail_cocktail_screen.dart';
import 'widget/search_cocktail_by_name_widget.dart';

class SearchCocktailScreen extends StatelessWidget {
  const SearchCocktailScreen({Key? key}) : super(key: key);

  static const String routeName = "/searchCocktailScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DrinkProvider>(builder: (ctx, provider, _) {
        return Column(
          children: [
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SearhCocktailByNameWidget(),
            ),
            provider.drinksByNameSearch.isEmpty
            ?
            listaCronologiaWidget(provider)
            :
            listaSearchByName(provider),
          ],
        );
      })
    );
  }

  Expanded listaSearchByName(DrinkProvider provider) {
    return Expanded(
      child: Container(
        // color: Colors.red,
        color: MyTheme.secondary,
        child: ListView.builder(
          itemCount: provider.drinksByNameSearch.length,
          itemBuilder: (context, i){
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: InkWell(
                onTap: () {
                  provider.saveSceltaInStorage(provider.drinksByNameSearch[i]);
                  provider.getDrinkById(provider.drinksByNameSearch[i].idDrink);
                  Navigator.of(context).pushNamed(DetailsCocktailScreen.routeName);
                },
                child: ListTile(
                  
                  title: Text(provider.drinksByNameSearch[i].strDrink, style: MyTheme.theme.textTheme.bodyMedium,),
                )
              ),
            );
          }
            
        ),
      )
    );
  }

  Expanded listaCronologiaWidget(DrinkProvider provider) {
    return Expanded(
      child: Container(
        // color: Colors.red,
        color: MyTheme.secondary,
        child: ListView.builder(
          itemCount: provider.cronologiaDrinks.length,
          itemBuilder: (context, i){
            return InkWell(
              onTap: () {
                provider.getDrinkById(provider.cronologiaDrinks[i].idDrink);
                Navigator.of(context).pushNamed(DetailsCocktailScreen.routeName);
              },

              child: ListTile(
                leading: InkWell(
                  onTap: () {provider.deleteFromCronologia(provider.cronologiaDrinks[i]);},
                  child: Icon(Icons.close, color: Colors.grey,)
                ),
                title: Text(provider.cronologiaDrinks[i].strDrink, style: MyTheme.theme.textTheme.bodyMedium,),
              )
            );
            
          }
            
        ),
      )
    );
  }
}