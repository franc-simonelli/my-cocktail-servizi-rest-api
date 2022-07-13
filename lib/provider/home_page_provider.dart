// ignore_for_file: prefer_final_fields, unused_field

import 'package:autoproject/models/ingredienti_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

import '../models/drink_model.dart';
import '../services/drink_service.dart';

class HomeProvider extends ChangeNotifier {
  List<String> basi = ["Gin", "Vodka", "Light rum", "Dark rum", "Tequila", "Whiskey"];
  List<Ingredienti> _listaIngredienti = [];
  List<Ingredienti> _basiAlcoliche = [];
  bool _loading = false;
  late Ingredienti _ingredienteSelect;
  late List<Drink> _listaDrink = [];
  
  
  List<Ingredienti> get listaIngredienti => _listaIngredienti;
  List<Ingredienti> get basiAlcoliche => _basiAlcoliche;
  bool get loading => _loading;
  Ingredienti get ingredienteSelect => _ingredienteSelect;
  List<Drink> get listaDrink => _listaDrink;


  void getAllIngredienti() async {
    _loading = true;
    
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

      // ignore: iterable_contains_unrelated_type
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
    _listaDrink = await _drinkService.getDrinkByIngrediente(ingrediente);
    notifyListeners();

  }

  
}