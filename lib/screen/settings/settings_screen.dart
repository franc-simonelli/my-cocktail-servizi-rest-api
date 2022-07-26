// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:autoproject/screen/home/widget/ingrediente_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/ingredienti_provider.dart';
import '../../utils/my_theme.dart';
import 'widget/filter_ingredienti_widget.dart';
import 'widget/grid_view_ingredienti_preferiti_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const String routeName = "/preferiti";

  @override
  Widget build(BuildContext context) {

    final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

    

    return Scaffold(
      key: _drawerKey,
      backgroundColor: MyTheme.secondary,
      body: Consumer<IngredientiProvider>(builder: (ctx, provider, _) {
        return GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx > 0) {
              _drawerKey.currentState?.closeEndDrawer();
            }
            if (details.delta.dx < 0) {
              _drawerKey.currentState?.openEndDrawer();
              Provider.of<IngredientiProvider>(context, listen: false).reset();
              // Provider.of<HomeProvider>(context, listen: false).setIsopen(true);
            }
          },
          child: CustomScrollView(
            slivers: [
              sliverAppBar(),
              sliverList(context, provider)
            ],
          )
        );
      }),
      endDrawer: drawer(context),
    );
  }

  Widget drawer(context) {
    return Consumer<IngredientiProvider>(builder: (ctx, provider, _) {
      return Container(
        width: MediaQuery.of(context).size.width/2,
        child: Drawer(
          backgroundColor: MyTheme.primary,
          child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            children: [
              SizedBox(height: 30,),
              FilterIngredientiWidget(),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    childAspectRatio: 1
                  ),
                  itemCount: provider.ingredientiFiltratiByName.length,
                  itemBuilder: (BuildContext context, int i) { 
                    return InkWell(
                      onTap: () {
                        Provider.of<IngredientiProvider>(context, listen: false).salvaIngredientePrefeirito(provider.ingredientiFiltratiByName[i]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: IngredienteWidget(provider.ingredientiFiltratiByName[i], 100.0, 100.0, false)
                      ),
                    );
                  }
                ),
              ),
            ],
          ),
        ),
        ),
      );
    });
  }

  Widget sezionePossibiliScelteWidget(IngredientiProvider provider) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
        color: MyTheme.secondary
      ),
      
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Column(
          children: [
            FilterIngredientiWidget(),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 0,
                  childAspectRatio: 1
                ),
                itemCount: provider.ingredientiFiltratiByName.length,
                itemBuilder: (BuildContext context, int i) { 
                  return InkWell(
                    onTap: () {
                      Provider.of<IngredientiProvider>(context, listen: false).salvaIngredientePrefeirito(provider.ingredientiFiltratiByName[i]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: IngredienteWidget(provider.ingredientiFiltratiByName[i], 100.0, 100.0, false)
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buttonWidget(context) {
    return InkWell(
      onTap: () {
        // Provider.of<HomeProvider>(context, listen: false).setIsopen();
      },
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey.shade900,
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
        height: 40,
        width: 40,
        child: Center(
          child: Icon(Icons.list_outlined, color: Colors.grey,),
        ),
      ),
      
    );
  }

  Widget sliverAppBar() {
    return SliverAppBar(
      actions: <Widget>[
        Icon(Icons.menu, color: Colors.transparent,)
      ],
      backgroundColor: MyTheme.secondary,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0), // here the desired height
        child: Align(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Ingredienti preferiti", style: TextStyle(color: Colors.grey, fontSize: 40, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
      expandedHeight: 120,
      pinned: false,
      floating: true,
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
              borderRadius: BorderRadius.circular(30), 
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(.3)
                ]
              )
            )
          )
        ),
      ),
    );
  }

  Widget sliverList(context, provider) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Column(
            children: [
              provider.ingredientiPreferiti.length > 0
              ?
              GridViewIngredientiPreferitiWidget(provider.ingredientiPreferiti, 2)
              :
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Column(
                    children: [
                      Text("Qui puoi aggiungere degli ingredienti alla tua lista preferiti!", style: MyTheme.theme.textTheme.titleMedium,),
                      SizedBox(height: 10,),
                      Text("Fai swipe verso sinistra per aprire il menu laterale, e clicca sull'ingrediente che vuo aggiungere", style: MyTheme.theme.textTheme.titleSmall),
                      SizedBox(height: 10,),
                      Icon(Icons.swipe_left, color: Colors.grey, size: 45,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60,)
            ],
          )
        ]
      ),
    );
  }
}




// VERSIONE ORIGINALE
// child: provider.isOpen
// ?
// Column(
//   children: [
//     SizedBox(height: 50),
//     Expanded(
//       child: Row(
//         children: [
//           Expanded(
//             child: GridViewIngredientiPreferitiWidget(provider.ingredientiPreferiti, 1),
//           ),
//           provider.loading
//           ?
//           CircularProgressIndicator()
//           :
//           Expanded(
//             child: sezionePossibiliScelteWidget(provider)
//           )
//         ],
//       ),
//     ),
//     SizedBox(height: 70),
//   ],
// )
// :
// Column(
//   children: [
//     SizedBox(height: 50),
//     Expanded(
//       child: GridViewIngredientiPreferitiWidget(provider.ingredientiPreferiti, 2),
//     ),
//     SizedBox(height: 70),
//   ],
// ),


// --------------------------------------------------------------------------------------------------

// VERSIONE CON SLIVER


// Widget sliverList(context) {
//   return Consumer<HomeProvider>(builder: (ctx, provider, _) {
//     return SliverList(
//       delegate: SliverChildListDelegate(
//         [
//           provider.isOpen
//           ?
//           Column(
//             children: [
//               SizedBox(height: 50),
//               Expanded(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: GridViewIngredientiPreferitiWidget(provider.ingredientiPreferiti, 1),
//                     ),
//                     provider.loading
//                     ?
//                     CircularProgressIndicator()
//                     :
//                     Expanded(
//                       child: sezionePossibiliScelteWidget(provider)
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 70),
//             ],
//           )
//           :
//           Column(
//             children: [
//               SizedBox(height: 50),
//               Expanded(
//                 child: GridViewIngredientiPreferitiWidget(provider.ingredientiPreferiti, 2),
//               ),
//               SizedBox(height: 70),
//             ],
//           ),
//         ]
//       )
//     );
//   });
// } 

// child: CustomScrollView(
//   slivers: [
//     sliverAppBar(),
//     // sliverList(context)
//   ],
// )