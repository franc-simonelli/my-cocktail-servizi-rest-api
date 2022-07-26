// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/ingredienti_model.dart';
import '../../../provider/ingredienti_provider.dart';
import '../../../utils/my_theme.dart';

class IngredienteWidget extends StatelessWidget {
  final Ingredienti ingrediente;
  final width;
  final height;
  final optionDelete;

  IngredienteWidget(this.ingrediente, this.width, this.height, this.optionDelete);

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
                Expanded(child: Text(ingrediente.strIngredient1, style: MyTheme.theme.textTheme.labelSmall, maxLines: 1,)),
                optionDelete
                ?
                removeButtonWidget(context, ingrediente)
                :
                Container()
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: SizedBox(
                  height: height,
                  width: width,
                  child: Image.network("${ingrediente.image}", fit: BoxFit.cover,),
                ),
              ),
            ],
          )
        ],
      )
    );
  }

  Widget removeButtonWidget(context, ingrediente) {
    return InkWell(
      onTap: () {
        Provider.of<IngredientiProvider>(context, listen: false).removeIngredientePreferito(ingrediente);
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade900,
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: Offset(-2, -2),
              color: Colors.grey.shade800
            ),
            BoxShadow(
              blurRadius: 1,
              offset: Offset(2, 2),
              color: Colors.black
            )
          ]
        ),
        child: Icon(Icons.close, color: Colors.grey, size: 25)
      ),
    );
  }
}