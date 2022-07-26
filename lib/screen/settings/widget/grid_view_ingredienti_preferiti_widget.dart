// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../home/widget/ingrediente_widget.dart';

class GridViewIngredientiPreferitiWidget extends StatelessWidget {
  const GridViewIngredientiPreferitiWidget(this.lista, this.cross, {Key? key,}) : super(key: key);

  final cross;
  final lista;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: cross,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 1
      ),
      itemCount: lista.length,
      itemBuilder: (BuildContext context, int i) { 
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: IngredienteWidget(lista[i], 100.0, 100.0, true),
        );
      }
    );
  }
}