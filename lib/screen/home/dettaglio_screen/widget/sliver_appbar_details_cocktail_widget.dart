// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, prefer_const_constructors
import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';
import '../../widget/icon_favorite_widget.dart';

class SliverAppBarDetailsCocktail extends StatefulWidget {
  SliverAppBarDetailsCocktail({Key? key, this.provider}) : super(key: key);
  final provider;
  @override
  State<SliverAppBarDetailsCocktail> createState() => _SliverAppBarDetailsCocktailState();
}

class _SliverAppBarDetailsCocktailState extends State<SliverAppBarDetailsCocktail> with TickerProviderStateMixin{

  late AnimationController _controller;
  late Animation _animation;
  late Animation _animationOpacity;

   @override
  void initState() {
    _controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
    _animationOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
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
    return SliverAppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: IconAnimationWidget(drink: widget.provider.dettaglioDrink, startSize: 35.0, endSize: 50.0, screenName: 'detailsCocktail',),
        )
      ],
      leading: Icon(Icons.arrow_back, color: Colors.transparent,),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.0), 
        child: Opacity(
          opacity: _animationOpacity.value,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Row(
                  children: [
                    Expanded(child: Text(widget.provider.dettaglioDrink.strDrink, style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),)),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: _animation.value * 20),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(widget.provider.dettaglioDrink.strCategory!, style: TextStyle(color: Colors.grey, fontSize: 16)),
                    Text(widget.provider.dettaglioDrink.strGlass!, style: TextStyle(color: Colors.grey, fontSize: 16)),
                    Text(widget.provider.dettaglioDrink.strAlcoholic!, style: TextStyle(color: Colors.grey, fontSize: 16))
                  ],
                ),
              ),
              SizedBox(height: 5,),
            ],
          ),
        ),
      ),
      expandedHeight: 400,
      backgroundColor: Theme.of(context).primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Opacity(
            opacity: _animationOpacity.value,
            child: Container(
              decoration: BoxDecoration(
                // gradient: MyTheme.gradientAppBar,
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: NetworkImage('${widget.provider.dettaglioDrink.strDrinkThumb}'),
                  fit: BoxFit.cover
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: MyTheme.gradientAppBar,
                  borderRadius: BorderRadius.circular(30),
                ),
              )  
            ),
          ),
        ),
        
      ),
    );
  }
}