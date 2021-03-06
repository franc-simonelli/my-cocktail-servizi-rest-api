// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../provider/drink_provider.dart';

class SearhCocktailByNameWidget extends StatefulWidget {
  SearhCocktailByNameWidget({Key? key}) : super(key: key);

  @override
  State<SearhCocktailByNameWidget> createState() => _SearhCocktailByNameWidgetState();
}

class _SearhCocktailByNameWidgetState extends State<SearhCocktailByNameWidget> {
  final _searchController = TextEditingController();

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchWithDebounce);
  }

  _onSearchWithDebounce() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 100), () {
      searchText();
    });
  }

  void searchText() {
    Provider.of<DrinkProvider>(context, listen: false).searchByName(_searchController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).splashColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey)
      ),
      child: TextField(  
        controller: _searchController,
        cursorColor: const Color.fromARGB(255, 21, 21, 26),
        style: const TextStyle(fontSize: 18),
        
        decoration: InputDecoration(
          suffixIcon: Icon(Icons.search, color: Colors.grey,),
          contentPadding: EdgeInsets.all(15),
          hintText: 'Cerca . . .',
          hintStyle: GoogleFonts.josefinSans(color: Colors.grey, fontSize: 17),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}