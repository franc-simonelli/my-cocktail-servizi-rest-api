// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/drink_provider.dart';
import '../../dettaglio_screen/detail_cocktail_screen.dart';
import '../../widget/cocktail_widget.dart';

class GridViewCocktailWidget extends StatelessWidget {
  GridViewCocktailWidget(this.lista);

  final lista;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 1.0
      ),
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int i) {

        return InkWell(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: CocktailWidget(
              lista[i],
            ),
          ),
          onTap: () {
            Provider.of<DrinkProvider>(context, listen: false).getDrinkById(lista[i].idDrink);
            Navigator.of(context).pushNamed(DetailsCocktailScreen.routeName);
          },
        );
      }
    );
  }
}