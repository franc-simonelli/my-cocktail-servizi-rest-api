
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/home_page_provider.dart';
import '../../utils/my_theme.dart';
import 'dettaglio_screen/detail_cocktail_screen.dart';
import 'widget/search_by_name_widget.dart';

class SearchCocktailScreen extends StatelessWidget {
  const SearchCocktailScreen({Key? key}) : super(key: key);

  static const String routeName = "/searchCocktailScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (ctx, provider, _) {
        return Column(
          children: [
            SizedBox(height: 70),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SearchByNameWidget(),
            ),
            provider.listaDrinkByNameSearch.isEmpty
            ?
            listaCronologiaWidget(provider)
            :
            listaSearchByName(provider),
          ],
        );
      })
    );
  }

  Expanded listaSearchByName(HomeProvider provider) {
    return Expanded(
      child: Container(
        // color: Colors.red,
        color: MyTheme.secondary,
        child: ListView.builder(
          itemCount: provider.listaDrinkByNameSearch.length,
          itemBuilder: (context, i){
            return Padding(
              padding: const EdgeInsets.all(0.0),
              child: InkWell(
                onTap: () {
                  provider.saveSceltaInStorage(provider.listaDrinkByNameSearch[i]);
                  provider.getDrinkById(provider.listaDrinkByNameSearch[i].idDrink);
                  Navigator.of(context).pushNamed(DetailsCocktailScreen.routeName);
                },
                child: ListTile(
                  
                  title: Text(provider.listaDrinkByNameSearch[i].strDrink, style: MyTheme.theme.textTheme.bodyMedium,),
                )
              ),
            );
          }
            
        ),
      )
    );
  }

  Expanded listaCronologiaWidget(HomeProvider provider) {
    return Expanded(
      child: Container(
        // color: Colors.red,
        color: MyTheme.secondary,
        child: ListView.builder(
          itemCount: provider.listaDrinkCronologia.length,
          itemBuilder: (context, i){
            return InkWell(
              onTap: () {
                provider.getDrinkById(provider.listaDrinkCronologia[i].idDrink);
                Navigator.of(context).pushNamed(DetailsCocktailScreen.routeName);
              },

              child: ListTile(
                leading: InkWell(
                  onTap: () {provider.deleteFromCronologia(provider.listaDrinkCronologia[i]);},
                  child: Icon(Icons.close, color: Colors.grey,)
                ),
                title: Text(provider.listaDrinkCronologia[i].strDrink, style: MyTheme.theme.textTheme.bodyMedium,),
              )
            );
            
          }
            
        ),
      )
    );
  }
}