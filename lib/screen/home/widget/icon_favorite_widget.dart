// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/home_page_provider.dart';

class IconAnimationWidget extends StatefulWidget {
  const IconAnimationWidget({
    Key? key,
    required this.drink,
    required this.startSize,
    required this.endSize,
    required this.screenName,
  }) : super(key: key);

  final drink;
  final startSize;
  final endSize;
  final screenName;

  @override
  State<IconAnimationWidget> createState() => _IconAnimationWidgetState();
}

class _IconAnimationWidgetState extends State<IconAnimationWidget> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation _sizeAnimation;

  @override
  void initState() {
    _controller = AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    _sizeAnimation = Tween<double>(begin: widget.startSize, end: widget.endSize).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _controller.addListener(() {
    setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async{
        widget.drink.isPreferito == true 
        ?
        Provider.of<HomeProvider>(context, listen: false).removePreferito(widget.drink.idDrink, true, widget.screenName)
        :
        Provider.of<HomeProvider>(context, listen: false).salvaNeiPreferiti(widget.drink.idDrink, widget.screenName);
        await _controller.forward();
        _controller.reverse();
      },
      child: Icon(
        Icons.favorite,
        size: _sizeAnimation.value,
        color: widget.drink.isPreferito == true ? Colors.red : Colors.grey 
      ),
    );
  }
}