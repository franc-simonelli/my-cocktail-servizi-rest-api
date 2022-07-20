// ignore_for_file: prefer_final_fields, unused_field

import 'dart:convert';

import 'package:autoproject/models/dettaglio_drink_model.dart';
import 'package:autoproject/models/ingredienti_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/drink_model.dart';
import '../services/drink_service.dart';

class HomeProvider extends ChangeNotifier {
  
  List<String> basi = ["Gin", "Vodka", "Light rum", "Dark rum", "Tequila", "Whiskey"];
  List<Ingredienti> _listaIngredienti = [];
  List<Ingredienti> _basiAlcoliche = [];
  bool _loading = false;
  late Ingredienti _ingredienteSelect;
  late List<Drink> _listaDrinkByIngrediente = [];
  late List<Drink> _listaDrinkFiltrataByIngrediente = [];
  late List<Drink> _listaDrinkByNameSearch = [];
  late List<Drink> _listaDrinkFull = [];
  late DettaglioDrink _dettaglioDrink;
  late List<Drink> _listaDrinkCronologia = [];
  late List<Drink> _listaDrinkCronologiaFiltrata = [];
  
  late List<String> _cocktailPreferitiId = [];
  late List<Drink> _listaPreferiti = [];



  List<Drink> get listaPreferiti => _listaPreferiti;
  List<Ingredienti> get listaIngredienti => _listaIngredienti;
  List<Ingredienti> get basiAlcoliche => _basiAlcoliche;
  bool get loading => _loading;
  Ingredienti get ingredienteSelect => _ingredienteSelect;
  List<Drink> get listaDrinkByIngrediente => _listaDrinkByIngrediente;
  List<Drink> get listaDrinkFiltrataByIngrediente => _listaDrinkFiltrataByIngrediente;
  List<Drink> get listaDrinkByNameSearch => _listaDrinkByNameSearch;
  List<Drink> get listaDrinkCronologia => _listaDrinkCronologia;
  List<Drink> get listaDrinkFull => _listaDrinkFull;
  List<Drink> get listaDrinkCronologiaFiltrata => _listaDrinkCronologiaFiltrata;
  DettaglioDrink get dettaglioDrink => _dettaglioDrink;


  void getAllIngredienti() async {
    _loading = true;
    _listaIngredienti = [];
    _basiAlcoliche = [];

    var _drinkService = Injector().get<DrinkService>();
    _listaIngredienti = await _drinkService.getAllIngredienti();

    for(var item in _listaIngredienti) {
      String newNameImage;
      if(item.strIngredient1.contains(' ')) {
        newNameImage = item.strIngredient1.replaceAll(' ', '%20');
      } else {
        newNameImage = item.strIngredient1;
      }
      item.image = 'https://www.thecocktaildb.com/images/ingredients/' + newNameImage + '-Small.png';

      if(basi.contains(item.strIngredient1)) {
        _basiAlcoliche.add(item);
      }
    }
    
    _listaIngredienti.sort(((a, b) => a.strIngredient1.compareTo(b.strIngredient1)));
    _basiAlcoliche.sort(((a, b) => a.strIngredient1.compareTo(b.strIngredient1)));

    _loading = false;
    notifyListeners();
  }

  void getDrinkByIngrediente(ingrediente) async{
    _ingredienteSelect = ingrediente;  
    var _drinkService = Injector().get<DrinkService>();
    _listaDrinkByIngrediente = await _drinkService.getDrinkByIngrediente(_ingredienteSelect.strIngredient1);
    _listaDrinkFiltrataByIngrediente = _listaDrinkByIngrediente;
    notifyListeners();
  }

  void getDrinkById(id) async{
    _loading = true;
    var _drinkService = Injector().get<DrinkService>();
    var lista = await _drinkService.getDrinkById(id);
    _dettaglioDrink = lista[0];
    _loading = false;
    notifyListeners();
  }

  filtraCocktail(filter) {
    _listaDrinkFiltrataByIngrediente = _listaDrinkByIngrediente.where((x) => x.strDrink.toLowerCase().contains(filter.toLowerCase() )).toList();
    notifyListeners();  
  }

  searchByName(name) async {
    var _drinkService = Injector().get<DrinkService>();
    if(name.length > 1){
      _listaDrinkByNameSearch = await _drinkService.getDrinkByName(name);
    } else {
      _listaDrinkByNameSearch = [];
    }
    
    notifyListeners();  
  }
  
  saveSceltaInStorage(Drink drink) async {
    final prefs = await SharedPreferences.getInstance();
    _listaDrinkCronologia.add(drink);
    final String encodedData = Drink.encode(_listaDrinkCronologia);
    await prefs.setString('cronologia', encodedData);
  }

  deleteFromCronologia(drink) async {
    _listaDrinkCronologia.remove(drink);
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = Drink.encode(_listaDrinkCronologia);
    await prefs.setString('cronologia', encodedData);
    notifyListeners();  
  }

  initSearch() async {
    _listaDrinkByNameSearch = [];
    _listaDrinkCronologia = [];
    final prefs = await SharedPreferences.getInstance();
    final String? drinkString = prefs.getString('cronologia');

    if(drinkString!.isNotEmpty) {
       _listaDrinkCronologia = Drink.decode(drinkString);
    }
    notifyListeners();
  }

  salvaNeiPreferiti(id) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? preferiti = prefs.getStringList('preferiti');
    if(preferiti!.contains(id)) {
      preferiti.remove(id);
    } else {
      preferiti.add(id);
    }
    await prefs.setStringList('preferiti', preferiti);

    notifyListeners();
  }

  // Future<Color> checkPreferiti(id) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final List<String>? preferiti = prefs.getStringList('preferiti');
    
  //   if(preferiti!.contains(id)) {
  //     return Colors.red;
      
  //   } else {
  //     return Colors.grey;
  //   }
    
  // }

  generateListaPreferiti() async {
    // _loading = true;
    _listaPreferiti = [];
    final prefs = await SharedPreferences.getInstance();
    // prefs.remove('preferiti');
    final List<String>? preferiti = prefs.getStringList('preferiti');
  

    if(preferiti!.isNotEmpty) {
      var _drinkService = Injector().get<DrinkService>();
      for(var item in preferiti ) {
        var lista = await _drinkService.getDrinkByIdPreferiti(item);
        _listaPreferiti.add(lista[0]);
      }
    }

    _loading = false;
    notifyListeners();
  }

  removePreferito(drink) {
    if(_listaPreferiti.contains(drink)) {
      _listaPreferiti.remove(drink);
      notifyListeners();
    }
    
  }
  
}