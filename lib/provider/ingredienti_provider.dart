import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ingredienti_model.dart';
import '../services/drink_service.dart';

class IngredientiProvider extends ChangeNotifier {

  bool _loading = false;
  List<String> ingredientiPreferitiPrefs = [];
  List<Ingredienti> _ingredienti = [];
  List<Ingredienti> _ingredientiPreferiti = [];
  late Ingredienti _ingredienteSelect;
  late List<Ingredienti> _ingredientiFiltratiByName = [];

  bool get loading => _loading;
  List<Ingredienti> get ingredienti => _ingredienti;
  List<Ingredienti> get ingredientiPreferiti => _ingredientiPreferiti;
  Ingredienti get ingredienteSelect => _ingredienteSelect;
  List<Ingredienti> get ingredientiFiltratiByName => _ingredientiFiltratiByName;


  Future<List<String>?> getSharedPreferences(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? list = prefs.getStringList(key);
    return list;
  }

  reset() {
    _ingredientiFiltratiByName = _ingredienti;
    notifyListeners();
  }

  deleteAllBasiPreferite() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('IngredientiPreferiti', ['']);
    _ingredientiPreferiti = [];
    ingredientiPreferitiPrefs = [];
    notifyListeners();
  }

  salvaIngredientePrefeirito(ingrediente) async {
    if(!_ingredientiPreferiti.contains(ingrediente)) {
      _ingredientiPreferiti.insert(0, ingrediente);
      ingredientiPreferitiPrefs.insert(0, ingrediente.strIngredient1);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('IngredientiPreferiti', ingredientiPreferitiPrefs);
    }
    
    notifyListeners();
  }

  resetFiltroIngredienti() {
    _ingredientiFiltratiByName = [];
    // notifyListeners();
  }

  filtraIngredienti(filter) {
    _ingredientiFiltratiByName = _ingredienti.where((x) => x.strIngredient1.toLowerCase().contains(filter.toLowerCase() )).toList();
    notifyListeners();
  }

  getAllIngredienti() async {
    _loading = true;
    _ingredienti = [];
    _ingredientiPreferiti = [];
    ingredientiPreferitiPrefs = [];
    ingredientiPreferitiPrefs = (await getSharedPreferences('IngredientiPreferiti'))!;
    var _drinkService = Injector().get<DrinkService>();
    _ingredienti = await _drinkService.getAllIngredienti();
    for(var item in _ingredienti) {
      String newNameImage;
      if(item.strIngredient1.contains(' ')) {
        newNameImage = item.strIngredient1.replaceAll(' ', '%20');
      } else {
        newNameImage = item.strIngredient1;
      }
      item.image = 'https://www.thecocktaildb.com/images/ingredients/' + newNameImage + '-Small.png';
      if(ingredientiPreferitiPrefs.isNotEmpty) {
        if(ingredientiPreferitiPrefs.contains(item.strIngredient1)) {
        _ingredientiPreferiti.add(item);
      }
      }
    }
    
    _ingredienti.sort(((a, b) => a.strIngredient1.compareTo(b.strIngredient1)));
    _ingredientiPreferiti.sort(((a, b) => a.strIngredient1.compareTo(b.strIngredient1)));
    _ingredientiFiltratiByName = _ingredienti;
    // if(_ingredientiPreferiti.isEmpty) {
    //   _isOpen = true;
    // }
    _loading = false;
    notifyListeners();
  }

  

  removeIngredientePreferito(ingrediente) async {
    _ingredientiPreferiti.remove(ingrediente);
    ingredientiPreferitiPrefs.remove(ingrediente.strIngredient1);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('IngredientiPreferiti', ingredientiPreferitiPrefs);
    notifyListeners();
  }

}