import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';

import '../../provider/home_page_provider.dart';

class AllCocktailScreen extends StatelessWidget {
  const AllCocktailScreen({ Key? key }) : super(key: key);
  static const String routeName = "/allCocktail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.secondary,
      body: Consumer<HomeProvider>(builder: (ctx, provider, _) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${provider.ingredienteSelect.strIngredient1}", style: MyTheme.theme.textTheme.titleMedium,),
                  ],
                ),
                
          
                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 40,
                    childAspectRatio: 1.0
                  ),
                  itemCount: provider.listaDrink.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      width: 120,
                      height: 100,
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
                                Expanded(child: Text("${provider.listaDrink[i].strDrink}", style: MyTheme.theme.textTheme.labelSmall))
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  height: 80,
                                  width: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network("${provider.listaDrink[i].strDrinkThumb}", fit: BoxFit.cover,)
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    );
                  }
                )
              ]
            ),
          ),
        );
      }),
    );
  }
}