import 'dart:convert';

import 'package:autoproject/models/drink_model.dart';
import 'package:autoproject/models/ingredienti_model.dart';
import 'package:autoproject/services/http_service.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';


class DrinkService {
  final HttpService _httpService = Injector().get<HttpService>();

  Future<List<Ingredienti>> getAllIngredienti() async {
    // Fimber.i("FaqsService - getFaqs started");
    var response = await _httpService.httpGet("v1/1/list.php?i=list");
    if (response.success == true) {
      // Fimber.i('Faqs founded');
      List<Ingredienti> ingredienti = [];
      (jsonDecode(response.data)['drinks'] as List<dynamic>).forEach((element) {
        // element.image = 'https://www.thecocktaildb.com/images/ingredients/' + element[0].value +  '-Small.png';
        ingredienti.add(Ingredienti.fromJson(element));

      });
      // print(ingredienti);
      // Fimber.i('Faqs founded ${faqs.length}');
      return ingredienti;
    } else {
      // Fimber.i('FaqsService - getFaqs error intercepted');
      throw new Exception(
          "Errore in fase di recupero delle informazioni: ${response.errorMessage}");
    }
  }

  Future<List<Drink>> getDrinkByIngrediente(ingrediente) async {
    // Fimber.i("FaqsService - getFaqs started");
    var response = await _httpService.httpGet("v1/1/filter.php?i=$ingrediente");
    if (response.success == true) {
      // Fimber.i('Faqs founded');
      List<Drink> drink = [];
      (jsonDecode(response.data)['drinks'] as List<dynamic>).forEach((element) {
        // element.image = 'https://www.thecocktaildb.com/images/ingredients/' + element[0].value +  '-Small.png';
        drink.add(Drink.fromJson(element));

      });
      // print(ingredienti);
      // Fimber.i('Faqs founded ${faqs.length}');
      return drink;
    } else {
      // Fimber.i('FaqsService - getFaqs error intercepted');
      throw new Exception(
          "Errore in fase di recupero delle informazioni: ${response.errorMessage}");
    }
  }

 
}
