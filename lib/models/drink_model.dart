// ignore_for_file: prefer_collection_literals

import 'dart:convert';

class Drink {
  late String idDrink;
  late String strDrink;
  late String? strDrinkThumb;
  late String? strCategory;
  late String? strAlcoholic;
  late String? strGlass;
  late bool? isPreferito;

  Drink(this.idDrink, this.strDrink, this.strDrinkThumb, this.strCategory, this.strAlcoholic, this.strGlass, this.isPreferito);

  Drink.fromJson(Map<String, dynamic> json) {
    idDrink = json['idDrink'];
    strDrink = json['strDrink'];
    strDrinkThumb = json['strDrinkThumb'];
    strCategory = json['strCategory'];
    strAlcoholic = json['strAlcoholic'];
    strGlass = json['strGlass'];
    isPreferito = json['isPreferito'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idDrink'] = idDrink;
    data['strDrink'] = strDrink;
    data['strDrinkThumb'] = strDrinkThumb;
    data['strCategory'] = strCategory;
    data['strAlcoholic'] = strAlcoholic;
    data['strGlass'] = strGlass;
    data['isPreferito'] = isPreferito;
    return data;
  }

  static Map<String, dynamic> toMap(Drink drink) => {
        'idDrink': drink.idDrink,
        'strDrink': drink.strDrink,
        'strDrinkThumb': drink.strDrinkThumb,
        'strCategory': drink.strCategory,
        'strAlcoholic': drink.strAlcoholic,
        'strGlass': drink.strGlass,
        'isPreferito': drink.isPreferito,
      };

  static String encode(List<Drink> drinks) => json.encode(
    drinks
      .map<Map<String, dynamic>>((drink) => Drink.toMap(drink))
      .toList(),
  );

  static List<Drink> decode(String drinks) =>
      (json.decode(drinks) as List<dynamic>)
          .map<Drink>((item) => Drink.fromJson(item))
          .toList();
}
