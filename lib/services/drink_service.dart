// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:autoproject/models/dettaglio_drink_model.dart';
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
        ingredienti.add(Ingredienti.fromJson(element));

      });
      // print(ingredienti);
      // Fimber.i('Faqs founded ${faqs.length}');
      return ingredienti;
    } else {
      // Fimber.i('FaqsService - getFaqs error intercepted');
      throw Exception(
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
      throw Exception(
          "Errore in fase di recupero delle informazioni: ${response.errorMessage}");
    }
  }

   Future<List<DettaglioDrink>> getDrinkById(id) async {
    var response = await _httpService.httpGet("/v1/1/lookup.php?i=$id");

    if (response.success == true) {
      List<DettaglioDrink> drink = [];
      (jsonDecode(response.data)['drinks'] as List<dynamic>).forEach((element) {
        // element.image = 'https://www.thecocktaildb.com/images/ingredients/' + element[0].value +  '-Small.png';
        drink.add(DettaglioDrink.fromJson(element));

      });
      return drink;
    } else {
      throw Exception(
          "Errore in fase di invio: ${response.errorMessage}");
    }
  }

  Future<List<Drink>> getDrinkByIdPreferiti(id) async {
    var response = await _httpService.httpGet("/v1/1/lookup.php?i=$id");

    if (response.success == true) {
      List<Drink> drink = [];
      (jsonDecode(response.data)['drinks'] as List<dynamic>).forEach((element) {
        // element.image = 'https://www.thecocktaildb.com/images/ingredients/' + element[0].value +  '-Small.png';
        drink.add(Drink.fromJson(element));

      });
      return drink;
    } else {
      throw Exception(
          "Errore in fase di invio: ${response.errorMessage}");
    }
  }

  Future<List<Drink>> getDrinkByName(name) async {
    // Fimber.i("FaqsService - getFaqs started");
    var response = await _httpService.httpGet("v1/1/search.php?s=$name");
    if (response.success == true) {
      // Fimber.i('Faqs founded');
      List<Drink> drink = [];
      (jsonDecode(response.data)['drinks'] as List<dynamic>).forEach((element) {
        // element.image = 'https://www.thecocktaildb.com/images/ingredients/' + element[0].value +  '-Small.png';
        drink.add(Drink.fromJson(element));
        
      });
      // print(ingredienti);
      // Fimber.i('Faqs founded ${faqs.length}');
      // drink.map((e) => e.cronologia = false);
      return drink;
    } else {
      // Fimber.i('FaqsService - getFaqs error intercepted');
      throw Exception(
          "Errore in fase di recupero delle informazioni: ${response.errorMessage}");
    }
  }

 
}
