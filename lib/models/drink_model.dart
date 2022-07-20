import 'dart:convert';

class Drink {
  late String idDrink;
  late String strDrink;
  late String? strDrinkThumb;
  late String? strCategory;
  late String? strAlcoholic;
  late String? strGlass;
  // late bool cronologia;

  Drink(this.idDrink, this.strDrink, this.strDrinkThumb, this.strCategory, this.strAlcoholic, this.strGlass);

  Drink.fromJson(Map<String, dynamic> json) {
    idDrink = json['idDrink'];
    strDrink = json['strDrink'];
    strDrinkThumb = json['strDrinkThumb'];
    strCategory = json['strCategory'];
    strAlcoholic = json['strAlcoholic'];
    strGlass = json['strGlass'];
    // cronologia = json['cronologia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idDrink'] = this.idDrink;
    data['strDrink'] = this.strDrink;
    data['strDrinkThumb'] = this.strDrinkThumb;
    data['strCategory'] = this.strCategory;
    data['strAlcoholic'] = this.strAlcoholic;
    data['strGlass'] = this.strGlass;
    // data['cronologia'] = this.cronologia;
    return data;
  }

  static Map<String, dynamic> toMap(Drink drink) => {
        'idDrink': drink.idDrink,
        'strDrink': drink.strDrink,
        'strDrinkThumb': drink.strDrinkThumb,
        'strCategory': drink.strCategory,
        'strAlcoholic': drink.strAlcoholic,
        'strGlass': drink.strGlass,
        // 'cronologia': drink.cronologia,
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
