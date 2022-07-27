// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/drink_provider.dart';
import '../../../utils/my_theme.dart';
import '../widget/icon_favorite_widget.dart';
import 'widget/sliver_appbar_details_cocktail_widget.dart';
import 'widget/sliver_list_details_cocktail_widget.dart';

class DetailsCocktailScreen extends StatelessWidget {
  const DetailsCocktailScreen({Key? key}) : super(key: key);
  static const String routeName = "/detailsCocktail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Consumer<DrinkProvider>(builder: (ctx, provider, _) {
        return provider.loading 
        ?
        Center(
          child: CircularProgressIndicator(),
        )
        :
        CustomScrollView(
          slivers: [
            SliverAppBarDetailsCocktail(provider: provider),
            SliverListDetailsCocktail(provider: provider)
          ],
        );

      }),
    );
  }

  Widget sliverAppBarDetails(DrinkProvider provider, context) {
    return SliverAppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: IconAnimationWidget(drink: provider.dettaglioDrink, startSize: 35.0, endSize: 50.0, screenName: 'detailsCocktail',),
        )
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0), // here the desired height
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 50),
              child: Row(
                children: [
                  Expanded(child: Text(provider.dettaglioDrink.strDrink, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 0),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(provider.dettaglioDrink.strCategory!, style: TextStyle(color: Colors.grey, fontSize: 16)),
                  Text(provider.dettaglioDrink.strGlass!, style: TextStyle(color: Colors.grey, fontSize: 16)),
                  Text(provider.dettaglioDrink.strAlcoholic!, style: TextStyle(color: Colors.grey, fontSize: 16))
                ],
              ),
            ),
            SizedBox(height: 5,),
          ],
        ),
      ),
      expandedHeight: 400,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Container(
            decoration: BoxDecoration(
              // gradient: MyTheme.gradientAppBar,
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage('${provider.dettaglioDrink.strDrinkThumb}'),
                fit: BoxFit.cover
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: MyTheme.gradientAppBar,
                borderRadius: BorderRadius.circular(30),
              ),
            )  
          ),
        ),
        
      ),
    );
  }

  
}