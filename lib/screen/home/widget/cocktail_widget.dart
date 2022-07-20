import 'package:autoproject/models/drink_model.dart';
import 'package:autoproject/provider/home_page_provider.dart';
import 'package:autoproject/provider/preferiti_provider.dart';
import 'package:autoproject/screen/widget/immagine_cocktail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../utils/my_theme.dart';

class CocktailWidget extends StatelessWidget {
  final Drink drink;
  // final tap;

  CocktailWidget(
    this.drink, 
    // this.tap
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {tap;} ,
      child: Container(
        // width: 120,
        // height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // border: Border.all(color: Colors.grey),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              MyTheme.primary,
              MyTheme.cocktailCard,
              
            ], 
          ),
          boxShadow: [
              BoxShadow(
                blurRadius: 2,
                offset: Offset(-3, -3),
                color: Colors.grey.shade800
              ),
              BoxShadow(
                blurRadius: 2,
                offset: Offset(3, 3),
                color: Colors.black
              )
           ]
        ),
        child: 
          Column(
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
                          child: Icon(Icons.favorite, 
                            color: Colors.red
                          ),
                            // color: Colors.red),
                          onTap: () {
                            Provider.of<HomeProvider>(context, listen: false).salvaNeiPreferiti(drink.idDrink);
                            Provider.of<HomeProvider>(context, listen: false).removePreferito(drink);
                          },
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
          Expanded(child: Text("${drink.strDrink}", style: MyTheme.theme.textTheme.labelSmall))
        ],
      ),
    );
  }

  // Widget immagineCocktailWidget() {
  //   return Padding(
  //     padding: const EdgeInsets.only(right: 15),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(20),
  //         border: Border.all(color: Colors.grey)
  //       ),
  //       height: 110,
  //       width: 110,
  //       child: ClipRRect(
  //         borderRadius: BorderRadius.circular(20),
  //         child: Image.network("${drink.strDrinkThumb}", fit: BoxFit.contain,)
  //       ),
  //     ),
  //   );
  // }
}