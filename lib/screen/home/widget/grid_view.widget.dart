import 'package:autoproject/screen/home/widget/cocktail_widget.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:provider/provider.dart';

import '../../../provider/home_page_provider.dart';
import '../detail_cocktail_screen.dart';

class GridViewWidget extends StatelessWidget {
  GridViewWidget(this.lista);

  final lista;
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
              // {
              //   Provider.of<HomeProvider>(context, listen: false).getDrinkById(lista[i].idDrink),
              //   Navigator.of(context).pushNamed(DetailsCocktailScreen.routeName)
              // }
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