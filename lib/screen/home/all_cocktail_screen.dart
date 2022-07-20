// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:autoproject/screen/home/detail_cocktail_screen.dart';
import 'package:autoproject/screen/home/widget/cocktail_widget.dart';
import 'package:autoproject/screen/home/widget/filter_search_widget.dart';
import 'package:autoproject/screen/home/widget/grid_view.widget.dart';
import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/home_page_provider.dart';

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
          SliverAppBar(
            backgroundColor: MyTheme.secondary,
            pinned: false,
            snap: false,
            floating: true,
            expandedHeight: 65.0,
            leading: Icon(Icons.arrow_back, color: Colors.transparent,),
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.0,
              // centerTitle: true,
              titlePadding: EdgeInsets.only(top: 35, left: 20, right: 20, bottom: 5),

              title: FilterWidget(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Consumer<HomeProvider>(builder: (ctx, provider, _) {
                  return Column(
                    children: [
                      // gridViewAllCocktail(provider)
                      GridViewWidget(provider.listaDrinkFiltrataByIngrediente)
                    ]
                  );
                }),
              ]
            ),
          )
        ]

      )
    );
  }

  // Widget gridViewAllCocktail(HomeProvider provider) {
  //   return GridView.builder(
  //     physics: NeverScrollableScrollPhysics(),
  //     shrinkWrap: true,
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       mainAxisSpacing: 30,
  //       crossAxisSpacing: 40,
  //       childAspectRatio: 1.0
  //     ),
  //     itemCount: provider.listaDrinkFiltrataByIngrediente.length,
  //     itemBuilder: (BuildContext context, int i) {
  //       return InkWell(
  //         child: CocktailWidget(provider.listaDrinkFiltrataByIngrediente[i]),
  //         onTap: () {
  //           Provider.of<HomeProvider>(context, listen: false).getDrinkById(provider.listaDrinkFiltrataByIngrediente[i].idDrink);
  //           Navigator.of(context).pushNamed(DetailsCocktailScreen.routeName);
  //         },
  //       );
  //     }
  //   );
  // }
}

