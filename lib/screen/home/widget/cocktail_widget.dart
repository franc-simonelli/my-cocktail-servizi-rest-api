
// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import '../../../models/drink_model.dart';
import '../../../utils/my_theme.dart';
import '../../widget/immagine_cocktail_widget.dart';
import 'icon_favorite_widget.dart';

class CocktailWidget extends StatelessWidget {
  final Drink drink;
 
  CocktailWidget(
    this.drink, 
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: MyTheme.gradientCocktail,
          boxShadow: MyTheme.shadowCocktail
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            nomeCocktailWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ImmagineCocktaiWidget(height: 110.0, width: 110.0, link: drink.strDrinkThumb,),
              
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    children: [
                      InkWell(
                        child: IconAnimationWidget(drink: drink, startSize: 25.0, endSize: 40.0, screenName: 'allCocktail',),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }


  Widget nomeCocktailWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0, ),
      child: Row(
        children: [
          Expanded(child: Text(drink.strDrink, style: MyTheme.theme.textTheme.labelSmall))
        ],
      ),
    );
  }

}

