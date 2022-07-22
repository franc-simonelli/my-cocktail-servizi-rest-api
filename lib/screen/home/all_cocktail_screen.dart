// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_page_provider.dart';
import '../../utils/my_theme.dart';
import 'widget/filter_search_widget.dart';
import 'widget/grid_view.widget.dart';

class AllCocktailScreen extends StatelessWidget {
  const AllCocktailScreen({ Key? key }) : super(key: key);
  static const String routeName = "/allCocktail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.secondary,
      body: CustomScrollView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          sliverAppBarAllCocktail(),
          sliverListAllCocktail(),
        ]
      )
    );
  }

  Widget sliverListAllCocktail() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Consumer<HomeProvider>(builder: (ctx, provider, _) {
            return Column(
              children: [
                GridViewWidget(provider.listaDrinkFiltrataByIngrediente, provider)
              ]
            );
          }),
        ]
      ),
    );
  }

  Widget sliverAppBarAllCocktail() {
    return SliverAppBar(
      backgroundColor: MyTheme.secondary,
      pinned: false,
      snap: false,
      floating: true,
      expandedHeight: 65.0,
      leading: Icon(Icons.arrow_back, color: Colors.transparent,),
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.0,
        titlePadding: EdgeInsets.only(top: 35, left: 20, right: 20, bottom: 5),
        title: FilterWidget(),
      ),
    );
  }

  
}

