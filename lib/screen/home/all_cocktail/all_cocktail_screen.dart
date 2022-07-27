// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/drink_provider.dart';
import '../../../utils/my_theme.dart';
import 'widget/filtro_all_cocktail_widget.dart';
import 'widget/grid_view_cocktail_widget.dart';

class AllCocktailScreen extends StatelessWidget {
  const AllCocktailScreen({ Key? key }) : super(key: key);
  static const String routeName = "/allCocktail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          sliverAppBarAllCocktail(context),
          sliverListAllCocktail(),
        ]
      )
    );
  }

  Widget sliverListAllCocktail() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Consumer<DrinkProvider>(builder: (ctx, provider, _) {
            return provider.loading
            ?
            loadinGridWidget()
            :
            Column(
              children: [
                GridViewCocktailWidget(provider.drinksFiltratiByIngrediente)
              ]
            );
          }),
        ]
      ),
    );
  }

  Widget loadinGridWidget() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: 1
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int i) {

        return Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: MyTheme.gradientCocktail,
              boxShadow: MyTheme.shadowCocktail
            ),
          )
        );
      }
    );
  }

  Widget sliverAppBarAllCocktail(context) {
    return SliverAppBar(
      backgroundColor: Theme.of(context).primaryColor,
      pinned: false,
      snap: false,
      floating: true,
      expandedHeight: 120.0,
      leading: Icon(Icons.arrow_back, color: Colors.transparent,),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('contents/images/all_cocktail.jpg'),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(30), 
          ),
          child: Container(
            decoration: BoxDecoration(
              // gradient: MyTheme.gradientAppBar
            )
          )
        ),
        expandedTitleScale: 1.0,
        titlePadding: EdgeInsets.only(top: 35, left: 20, right: 20, bottom: 5),
        title: FiltroAllCocktailWidget(),
      ),
    );
  }


}

