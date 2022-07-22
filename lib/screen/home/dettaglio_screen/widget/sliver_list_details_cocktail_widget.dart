// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';
import '../../../../provider/home_page_provider.dart';

class SliverListDetailsCocktail extends StatefulWidget {
  SliverListDetailsCocktail({Key? key, this.provider}) : super(key: key);
  final provider;
  @override
  State<SliverListDetailsCocktail> createState() => _SliverListDetailsCocktailState();
}

class _SliverListDetailsCocktailState extends State<SliverListDetailsCocktail> with TickerProviderStateMixin{

  late AnimationController _controller;
  late Animation _animation;

   @override
  void initState() {
    _controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.addListener(() {
    setState(() {});
    });

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(      
      delegate: SliverChildListDelegate(
        [
          Opacity(
            opacity: _animation.value,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: _animation.value * 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Ingredienti:", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),),
                      InkWell(child: Icon(Icons.info_outline, color: Colors.grey,), onTap: () {showInfo(context);},)
                    ],
                  ),
                  SizedBox(height: 10,),
                  listaIngredienti(widget.provider)
                  
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Opacity(
            opacity: _animation.value,
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: _animation.value * 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Preparazione: ", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10,),
                  Text("${widget.provider.dettaglioDrink.strInstructionsIT}",
                  style: TextStyle(color: Colors.grey, fontSize: 16))
                ],
              )
            ),
          )
        ]
      ),
    );
  }

  Widget listaIngredienti(HomeProvider provider) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            provider.dettaglioDrink.strIngredient1 != null ? Text("  ${provider.dettaglioDrink.strIngredient1}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient2 != null ? Text("  ${provider.dettaglioDrink.strIngredient2}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient3 != null ? Text("  ${provider.dettaglioDrink.strIngredient3}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient4 != null ? Text("  ${provider.dettaglioDrink.strIngredient4}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient5 != null ? Text("  ${provider.dettaglioDrink.strIngredient5}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient6 != null ? Text("  ${provider.dettaglioDrink.strIngredient6}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient7 != null ? Text("  ${provider.dettaglioDrink.strIngredient7}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient8 != null ? Text("  ${provider.dettaglioDrink.strIngredient8}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient9 != null ? Text("  ${provider.dettaglioDrink.strIngredient9}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient10 != null ? Text("  ${provider.dettaglioDrink.strIngredient10}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient11 != null ? Text("  ${provider.dettaglioDrink.strIngredient11}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient12 != null ? Text("  ${provider.dettaglioDrink.strIngredient12}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient13 != null ? Text("  ${provider.dettaglioDrink.strIngredient13}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient14 != null ? Text("  ${provider.dettaglioDrink.strIngredient14}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strIngredient15 != null ? Text("  ${provider.dettaglioDrink.strIngredient15}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            provider.dettaglioDrink.strMeasure1 != null ? Text("  ${provider.dettaglioDrink.strMeasure1}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure2 != null ? Text("  ${provider.dettaglioDrink.strMeasure2}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure3 != null ? Text("  ${provider.dettaglioDrink.strMeasure3}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure4 != null ? Text("  ${provider.dettaglioDrink.strMeasure4}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure5 != null ? Text("  ${provider.dettaglioDrink.strMeasure5}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure6 != null ? Text("  ${provider.dettaglioDrink.strMeasure6}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure7 != null ? Text("  ${provider.dettaglioDrink.strMeasure7}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure8 != null ? Text("  ${provider.dettaglioDrink.strMeasure8}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure9 != null ? Text("  ${provider.dettaglioDrink.strMeasure9}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure10 != null ? Text("  ${provider.dettaglioDrink.strMeasure10}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure11 != null ? Text("  ${provider.dettaglioDrink.strMeasure11}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure12 != null ? Text("  ${provider.dettaglioDrink.strMeasure12}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure13 != null ? Text("  ${provider.dettaglioDrink.strMeasure13}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure14 != null ? Text("  ${provider.dettaglioDrink.strMeasure14}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
            provider.dettaglioDrink.strMeasure15 != null ? Text("  ${provider.dettaglioDrink.strMeasure15}", style: TextStyle(color: Colors.grey, fontSize: 16)) : Container(),
          ],
        )
      ],
    );
  }

  Future<void> showInfo(context) async {
    return showDialog<void>(
      
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MyTheme.primary,
          title: Text('Informazioni', style: MyTheme.theme.textTheme.titleSmall,),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('1 oncia = 30 ml', style: MyTheme.theme.textTheme.bodyMedium,),
                Text('0.5 oncia = 15 ml', style: MyTheme.theme.textTheme.bodyMedium),
                Text('1/3 oncia = 10 ml', style: MyTheme.theme.textTheme.bodyMedium),
                Text('2/3 oncia = 20 ml', style: MyTheme.theme.textTheme.bodyMedium),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Chiudi', style: TextStyle(color: Colors.grey),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}