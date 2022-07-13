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
      body: Consumer<HomeProvider>(builder: (ctx, provider, _) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: 70,),
              Text("${provider.ingredienteSelect.strIngredient1}", style: MyTheme.theme.textTheme.titleMedium,),
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[100],
                    child: const Text("He'd have you all unravel at the"),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[200],
                    child: const Text('Heed not the rabble'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: Colors.teal[300],
                    child: const Text('Sound of screams but the'),
                  ),
                ]
              )
            ]
          ),
        );
      }),
    );
  }
}