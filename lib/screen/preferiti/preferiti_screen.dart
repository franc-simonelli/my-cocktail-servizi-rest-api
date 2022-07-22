// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/home_page_provider.dart';
import '../../utils/my_theme.dart';
import '../home/dettaglio_screen/detail_cocktail_screen.dart';
import 'widget/cocktail_preferito_card_widget.dart';

class PreferitiScreen extends StatelessWidget {
  const PreferitiScreen({ Key? key }) : super(key: key);
  static const String routeName = "/preferiti";


  @override
  Widget build(BuildContext context) {

    Provider.of<HomeProvider>(context, listen: false).generateListaPreferiti();

    return Scaffold(
      backgroundColor: MyTheme.secondary,
      body: CustomScrollView(
        slivers: [
          sliverAppBar(),
          sliverList(context)
        ],
      )
    );
  }

  Widget sliverList(context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Consumer<HomeProvider>(builder: (ctx, provider, _) {
            return Column(
              children: [
                provider.loading 
                ?
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 60),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
                :
                provider.listaPreferiti.isEmpty 
                ?
                Padding(
                  padding: EdgeInsets.only(top: 120),
                  child: Text("Non ci sono preferiti!", style: MyTheme.theme.textTheme.headlineSmall,))
                :
                listViewCocktailPreferiti(provider),
                SizedBox(height: 60)
              ],
            );
          })
        ]
      ),
    );
  }

  Widget sliverAppBar() {
    return SliverAppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0), // here the desired height
        child: Align(
          // alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("I tuoi preferiti", style: TextStyle(color: Colors.grey, fontSize: 40, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
      expandedHeight: 300,
      pinned: false,
      floating: true,
      backgroundColor: MyTheme.secondary,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('contents/images/sfondo_preferiti.jpg'),
              fit: BoxFit.cover
            ),
            borderRadius: BorderRadius.circular(30), 
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: MyTheme.gradientAppBar
            )
          )
        ),
      ),
    );
  }

  Widget listViewCocktailPreferiti(HomeProvider provider) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: provider.listaPreferiti.length,
      itemBuilder: ((context, i) {
        return InkWell(
          onTap: () {
            Provider.of<HomeProvider>(context, listen: false).getDrinkById(provider.listaPreferiti[i].idDrink);
            Navigator.of(context).pushNamed(DetailsCocktailScreen.routeName);
          },
          child: CocktailPreferitocardWidget(drink: provider.listaPreferiti[i])
          
        );
      })
    );
    
  }
}