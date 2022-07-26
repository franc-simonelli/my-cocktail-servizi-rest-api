// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:autoproject/screen/home/widget/ingrediente_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/drink_provider.dart';
import '../../all_cocktail/all_cocktail_screen.dart';

class GridViewIngredientiWidget extends StatelessWidget {
  GridViewIngredientiWidget(this.lista);

  final lista;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 1
      ),
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int i) {

        return InkWell(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: IngredienteWidget(
              lista[i],
              50.0,
              50.0,
              false
            ),
          ),
          onTap: () {
            Provider.of<DrinkProvider>(context, listen: false).getDrinkByIngrediente(lista[i]);
            Navigator.of(context).pushNamed(AllCocktailScreen.routeName);
          },
        );
      }
    );
  }
}