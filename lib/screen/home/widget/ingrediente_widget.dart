// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../../../models/ingredienti_model.dart';
import '../../../utils/my_theme.dart';

class IngredienteWidget extends StatelessWidget {
  final Ingredienti ingrediente;

  IngredienteWidget(this.ingrediente);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: MyTheme.primary),
        gradient: MyTheme.gradientIngrediente,
        boxShadow: MyTheme.shadowIngrediente
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0, ),
            child: Row(
              children: [
                Expanded(child: Text(ingrediente.strIngredient1, style: MyTheme.theme.textTheme.labelSmall, maxLines: 2,))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SizedBox(
                  height: 70,
                  width: 70,
                  child: Image.network("${ingrediente.image}", fit: BoxFit.cover,),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}