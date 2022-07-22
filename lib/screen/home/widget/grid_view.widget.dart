// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/home_page_provider.dart';
import '../dettaglio_screen/detail_cocktail_screen.dart';
import 'cocktail_widget.dart';

class GridViewWidget extends StatelessWidget {
  GridViewWidget(this.lista, this.provider);

  final lista;
  final HomeProvider provider;
  // final tap;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 1
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
            Provider.of<HomeProvider>(context, listen: false).getDrinkById(lista[i].idDrink);
            Navigator.of(context).pushNamed(DetailsCocktailScreen.routeName);
          },
        );
      }
    );
  }
}