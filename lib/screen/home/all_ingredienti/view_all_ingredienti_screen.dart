// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../provider/ingredienti_provider.dart';
import '../../../utils/my_theme.dart';
import 'widget/filtro_all_ingredienti_widget.dart';
import 'widget/grid_view_ingredienti_widget.dart';

class ViewAllIngredientiScreen extends StatefulWidget {
  const ViewAllIngredientiScreen({Key? key}) : super(key: key);

  static const String routeName = "/viewAllIngredienti";

  @override
  State<ViewAllIngredientiScreen> createState() => _ViewAllIngredientiScreenState();
}

class _ViewAllIngredientiScreenState extends State<ViewAllIngredientiScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: CustomScrollView(
        physics: ScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          sliverAppBarAllIngredienti(context),
          sliverListAllIngredienti(),
        ]
      )
    );
  }

  Widget sliverListAllIngredienti() {
    int cross = 3;
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Consumer<IngredientiProvider>(builder: (ctx, provider, _) {
            return provider.loading
            ?
            loadinGridWidget()
            :
            Column(
              children: [
                GridViewIngredientiWidget(provider.ingredientiFiltratiByName, cross, 50.0, 50.0, false),
                
              ]
            );
          }),
        ]
      ),
    );
  }

  Widget sliverAppBarAllIngredienti(context) {
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
              image: AssetImage('contents/images/ingredienti.jpg'),
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
        title: FiltroAllIngredientiWidget(),
      ),
    );
  }

  Widget loadinGridWidget() {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
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
}