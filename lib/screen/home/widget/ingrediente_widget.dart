import 'package:autoproject/models/ingredienti_model.dart';
import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';

class IngredienteWidget extends StatelessWidget {
  final Ingredienti ingrediente;

  IngredienteWidget(this.ingrediente);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            MyTheme.primary,
            Color.fromARGB(255, 17, 17, 20),
            
          ], 
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0, ),
            child: Row(
              children: [
                Expanded(child: Text("${ingrediente.strIngredient1}", style: MyTheme.theme.textTheme.labelSmall))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Container(
                  height: 80,
                  width: 80,
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