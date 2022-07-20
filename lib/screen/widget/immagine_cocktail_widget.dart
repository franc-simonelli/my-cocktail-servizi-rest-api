import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImmagineCocktaiWidget extends StatelessWidget {

  const ImmagineCocktaiWidget({Key? key, required this.width, required this.height, required this.link}) : super(key: key);
  final width;
  final height;
  final link;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey)
      ),
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(link, fit: BoxFit.contain,)
      ),
    );
  
  }
}