// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../provider/ingredienti_provider.dart';
import '../../../utils/my_theme.dart';

class FilterIngredientiWidget extends StatefulWidget {
  const FilterIngredientiWidget({Key? key}) : super(key: key);

  @override
  State<FilterIngredientiWidget> createState() => _FilterIngredientiWidgetState();
}

class _FilterIngredientiWidgetState extends State<FilterIngredientiWidget> {
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
    Provider.of<IngredientiProvider>(context, listen: false).filtraIngredienti(_searchController.text);
  }

  @override
  void dispose() {
    super.dispose();
    _debounce?.cancel();
    _searchController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: MyTheme.primary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey)
        ),
        child: TextField(  
          controller: _searchController,
          cursorColor: Color.fromARGB(255, 4, 4, 5),
          style: const TextStyle(fontSize: 18),
          
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey,),
            contentPadding: EdgeInsets.all(15),
            hintText: 'Filtra . . .',
            hintStyle: GoogleFonts.josefinSans(color: Colors.grey, fontSize: 17),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}