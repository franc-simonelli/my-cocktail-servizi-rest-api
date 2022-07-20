import 'dart:async';

import 'package:autoproject/provider/home_page_provider.dart';
import 'package:autoproject/utils/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SearchByNameWidget extends StatefulWidget {
  SearchByNameWidget({Key? key}) : super(key: key);

  @override
  State<SearchByNameWidget> createState() => _SearchByNameWidgetState();
}

class _SearchByNameWidgetState extends State<SearchByNameWidget> {
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
    Provider.of<HomeProvider>(context, listen: false).searchByName(_searchController.text);
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
        color: MyTheme.primary,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey)
      ),
      child: TextField(  
        controller: _searchController,
        cursorColor: Color.fromARGB(255, 21, 21, 26),
        style: TextStyle(fontSize: 18),
        
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