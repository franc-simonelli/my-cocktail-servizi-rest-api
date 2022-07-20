// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autoproject/models/drink_model.dart';
import 'package:autoproject/provider/home_page_provider.dart';
import 'package:autoproject/screen/home/widget/cocktail_widget.dart';
import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/preferiti_provider.dart';
import '../../utils/bottom_bar_screen.dart';
import '../home/detail_cocktail_screen.dart';
import '../widget/immagine_cocktail_widget.dart';

class PreferitiScreen extends StatelessWidget {
  const PreferitiScreen({ Key? key }) : super(key: key);
  static const String routeName = "/preferiti";


  @override
  Widget build(BuildContext context) {

    Provider.of<HomeProvider>(context, listen: false).generateListaPreferiti();

    return Scaffold(
      backgroundColor: MyTheme.primary,
      body: Consumer<HomeProvider>(builder: (ctx, provider, _) {
        return provider.loading
        ?
        Center(child: CircularProgressIndicator(),)
        :
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                SizedBox(height: 40,),
                listViewCocktailPreferiti(provider),
                SizedBox(height: 60,)
              ],
            ),
          ),
        );
      })
    );
  }

  Widget listViewCocktailPreferiti(HomeProvider provider) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: provider.listaPreferiti.length,
      itemBuilder: ((context, i) {
        return InkWell(
          onTap: () {
            Provider.of<HomeProvider>(context, listen: false).getDrinkById(provider.listaPreferiti[i].idDrink);
            Navigator.of(context).pushNamed(DetailsCocktailScreen.routeName);
          },
          child: cardCocktailPreferitoWidget(provider.listaPreferiti[i], context)
        );
      })
    );
    
  }

  Widget cardCocktailPreferitoWidget(Drink drink, context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyTheme.primary,
          // border: Border.all(color: Colors.grey)
           boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: Offset(-3, -3),
                color: Colors.grey.shade800
              ),
              BoxShadow(
                blurRadius: 2,
                offset: Offset(3, 3),
                color: Colors.black
              )
           ]
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(drink.strDrink, style: MyTheme.theme.textTheme.titleSmall),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ImmagineCocktaiWidget(height: 130.0, width: 130.0, link: drink.strDrinkThumb,),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(drink.strCategory!, style: MyTheme.theme.textTheme.labelSmall),
                        Text(drink.strGlass!, style: MyTheme.theme.textTheme.labelSmall),
                        Text(drink.strAlcoholic!, style: MyTheme.theme.textTheme.labelSmall),
                      ],
                    ),
                    width: 160,
                    height: 130,
                  )
                ],
              )
            ],
          ),
        )
      )
    );
  }
}