// ignore_for_file: prefer_final_fields, unused_field, avoid_types_as_parameter_names
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/drink_model.dart';
import '../services/drink_service.dart';

class DrinkProvider extends ChangeNotifier {
  
  bool _loading = false;
  bool _isOpen = false;
  // List<String> ingredientiPreferitiPrefs = [];
  // List<Ingredienti> _ingredienti = [];

  // List<Ingredienti> _ingredientiPreferiti = [];
  // late Ingredienti _ingredienteSelect;
  late List<Drink> _drinksByIngrediente = [];
  late List<Drink> _drinksFiltratiByIngrediente = [];
  late List<Drink> _drinksByNameSearch = [];
  late Drink _dettaglioDrink;
  late List<Drink> _cronologiaDrinks = [];
  late List<Drink> _drinksPreferiti = [];
  // late List<Ingredienti> _ingredientiFiltratiByName = [];

  bool get loading => _loading;
  bool get isOpen => _isOpen;
  // List<Ingredienti> get ingredienti => _ingredienti;
  // List<Ingredienti> get ingredientiPreferiti => _ingredientiPreferiti;
  // Ingredienti get ingredienteSelect => _ingredienteSelect;
  List<Drink> get drinksByIngrediente => _drinksByIngrediente;
  List<Drink> get drinksFiltratiByIngrediente => _drinksFiltratiByIngrediente;
  List<Drink> get drinksByNameSearch => _drinksByNameSearch;
  Drink get dettaglioDrink => _dettaglioDrink;
  List<Drink> get cronologiaDrinks => _cronologiaDrinks;
  List<Drink> get drinksPreferiti => _drinksPreferiti;
  // List<Ingredienti> get ingredientiFiltratiByName => _ingredientiFiltratiByName;

  
  setIsopen(bool) {
    // _isOpen = !_isOpen;
    _isOpen = bool;
    notifyListeners();
  }

  Future<List<String>?> getSharedPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? list = prefs.getStringList(key);
    return list;
  }

  getDrinkByIngrediente(ingrediente) async{
    _loading = true;
    List<String> preferiti = (await getSharedPreferences('preferiti'))!;
    // var ingredienteSelect = Provider.of<IngredientiProvider>(context, listen: false).ingredienteSelect;  
    var ingredienteSelect = ingrediente;
    var _drinkService = Injector().get<DrinkService>();
    _drinksByIngrediente = await _drinkService.getDrinkByIngrediente(ingredienteSelect.strIngredient1);
    
    for(var i=0; i < _drinksByIngrediente.length; i++) {
      if(preferiti.contains(_drinksByIngrediente[i].idDrink)) {
        _drinksByIngrediente[i].isPreferito = true;
      }
      else {
        _drinksByIngrediente[i].isPreferito = false;
      }
    }
    
    _drinksFiltratiByIngrediente = _drinksByIngrediente;
    _loading = false;
    notifyListeners();
  }

  getDrinkById(id) async{
    _loading = true;
    var _drinkService = Injector().get<DrinkService>();
    var lista = await _drinkService.getDrinkById(id);
    _dettaglioDrink = lista[0];
    List<String> preferiti = (await getSharedPreferences('preferiti'))!;
    if(preferiti.contains(_dettaglioDrink.idDrink)) {
      _dettaglioDrink.isPreferito = true;
    }else {
      _dettaglioDrink.isPreferito = false;
    }
    _loading = false;
    notifyListeners();
  }

  filtraCocktail(filter) {
    _drinksFiltratiByIngrediente = _drinksByIngrediente.where((x) => x.strDrink.toLowerCase().contains(filter.toLowerCase() )).toList();
    notifyListeners();  
  }

  searchByName(name) async {
    var _drinkService = Injector().get<DrinkService>();
    if(name.length > 1){
      _drinksByNameSearch = await _drinkService.getDrinkByName(name);
    } else {
      _drinksByNameSearch = [];
    }
    
    notifyListeners();  
  }
  
  saveSceltaInStorage(Drink drink) async {
    final prefs = await SharedPreferences.getInstance();
    _cronologiaDrinks.add(drink);
    final String encodedData = Drink.encode(_cronologiaDrinks);
    await prefs.setString('cronologia', encodedData);
  }

  deleteFromCronologia(drink) async {
    _cronologiaDrinks.remove(drink);
    final prefs = await SharedPreferences.getInstance();
    final String encodedData = Drink.encode(_cronologiaDrinks);
    await prefs.setString('cronologia', encodedData);
    notifyListeners();  
  }

  initSearch() async {
    _drinksByNameSearch = [];
    _cronologiaDrinks = [];
    final prefs = await SharedPreferences.getInstance();
    final String? drinkString = prefs.getString('cronologia');
    if(drinkString!.isNotEmpty) {
       _cronologiaDrinks = Drink.decode(drinkString);
    }
    notifyListeners();
  }

  salvaNeiPreferiti(id, screenName) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? preferiti = prefs.getStringList('preferiti');

    // AGGIUNGO IL NUOVO ID DRINK ALLA LISTA PREFERITI
    preferiti!.add(id);
    // CICLO LA LISTA DEI DRINK VISIBILE IN all_cocktail_screen PER AGGIORNARE L'ICONA DEL CUORE
    for(var item in _drinksFiltratiByIngrediente) {
      if(item.idDrink == id) {
        item.isPreferito = true;
      }
    }
    // CONTROLLO SE SONO SUL DETTAGLIO DEL DRINK PER AGGIORNARE L'ICONA DEL CUORE
    if(screenName == 'detailsCocktail') {
      _dettaglioDrink.isPreferito = true;
    }
    await prefs.setStringList('preferiti', preferiti);
    notifyListeners();
  }

  removePreferito(id, isHeart, screenName ) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? preferiti = prefs.getStringList('preferiti');
    // RIMUOVO L'ID DRINK ALLA LISTA PREFERITI
    preferiti!.remove(id);
    // CONTROLLO SE STO ELIMINANDO UN PREFERITO CLICCANDO SUL CUORE OPPURE DALLA LISTA PREFERITI (preferiti_screen)
    if(isHeart) {
      // CICLO LA LISTA DEI DRINK VISIBILE IN all_cocktail_screen PER AGGIORNARE L'ICONA DEL CUORE
      for(var item in _drinksFiltratiByIngrediente) {
        if(item.idDrink == id) {
          item.isPreferito = false;
        }
      }
    }else {
      // CICLO LA LISTA DEI DRINK PREFEITI VISIBILE IN preferiti_screen PER AGGIORNARE LA LISTA 
      for(var i=0; i < _drinksPreferiti.length; i++) {
        if(_drinksPreferiti[i].idDrink == id) {
          _drinksPreferiti.remove(_drinksPreferiti[i]);
        }
      }
    }
    if(screenName == 'detailsCocktail') {
      _dettaglioDrink.isPreferito = false;
    }
    await prefs.setStringList('preferiti', preferiti);
    notifyListeners();
  }

  generateListaPreferiti() async {
    _loading = true;
    _drinksPreferiti = [];
    List<String> preferiti = (await getSharedPreferences('preferiti'))!;
    if(preferiti.isNotEmpty) {
      var _drinkService = Injector().get<DrinkService>();
      for(var item in preferiti ) {
        if(item != '') {
          var lista = await _drinkService.getDrinkByIdPreferiti(item);
          _drinksPreferiti.add(lista[0]);
        }
      }
    }
    _loading = false;
    notifyListeners();
  }

  // removeIngredientePreferito(ingrediente) async {
  //   _ingredientiPreferiti.remove(ingrediente);
  //   ingredientiPreferitiPrefs.remove(ingrediente.strIngredient1);
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setStringList('IngredientiPreferiti', ingredientiPreferitiPrefs);
  //   notifyListeners();
  // }
  
}