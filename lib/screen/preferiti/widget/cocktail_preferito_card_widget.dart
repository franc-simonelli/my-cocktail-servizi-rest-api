// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/drink_provider.dart';
import '../../../utils/my_theme.dart';
import '../../widget/immagine_cocktail_widget.dart';

class CocktailPreferitocardWidget extends StatelessWidget {
  const CocktailPreferitocardWidget({Key? key, required this.drink}) : super(key: key);

  final drink;
  
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(drink.idDrink),
      onDismissed: (direction) {
        Provider.of<DrinkProvider>(context, listen: false).removePreferito(drink.idDrink, false, 'preferiti');

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('${drink.strDrink} rimosso')));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Theme.of(context).splashColor),
            // color: Theme.of(context).splashColor,
            color: Colors.black,
            boxShadow: MyTheme.shadowIngrediente
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(drink.strDrink, style: Theme.of(context).textTheme.titleSmall, ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ImmagineCocktaiWidget(height: 130.0, width: 130.0, link: drink.strDrinkThumb,),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(drink.strCategory!, style: Theme.of(context).textTheme.labelSmall),
                          Text(drink.strGlass!, style: Theme.of(context).textTheme.labelSmall),
                          Text(drink.strAlcoholic!, style: Theme.of(context).textTheme.labelSmall),
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
      ),
    );
  }
}