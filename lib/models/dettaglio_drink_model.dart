class DettaglioDrink {
  late String idDrink;
  late String strDrink;
  late String? strDrinkThumb;
  late String strCategory;
  late String strAlcoholic;
  late String strGlass;
  late String strInstructionsIT;
  late String? strIngredient1;
  late String? strIngredient2;
  late String? strIngredient3;
  late String? strIngredient4;
  late String? strIngredient5;
  late String? strIngredient6;
  late String? strIngredient7;
  late String? strIngredient8;
  late String? strIngredient9;
  late String? strIngredient10;
  late String? strIngredient11;
  late String? strIngredient12;
  late String? strIngredient13;
  late String? strIngredient14;
  late String? strIngredient15;
  late String? strMeasure1;
  late String? strMeasure2;
  late String? strMeasure3;
  late String? strMeasure4;
  late String? strMeasure5;
  late String? strMeasure6;
  late String? strMeasure7;
  late String? strMeasure8;
  late String? strMeasure9;
  late String? strMeasure10;
  late String? strMeasure11;
  late String? strMeasure12;
  late String? strMeasure13;
  late String? strMeasure14;
  late String? strMeasure15;
  late List<String> ingredienti;


  DettaglioDrink(
    this.idDrink, 
    this.strDrink, 
    this.strDrinkThumb, 
    this.strCategory, 
    this.strAlcoholic, 
    this.strGlass, 
    this.strInstructionsIT,
    this.strIngredient1, 
    this.strIngredient2, 
    this.strIngredient3, 
    this.strIngredient4, 
    this.strIngredient5, 
    this.strIngredient6,
    this.strIngredient7, 
    this.strIngredient8, 
    this.strIngredient9, 
    this.strIngredient10, 
    this.strIngredient11, 
    this.strIngredient12,
    this.strIngredient13, 
    this.strIngredient14, 
    this.strIngredient15,
    this.strMeasure1, 
    this.strMeasure2, 
    this.strMeasure3, 
    this.strMeasure4, 
    this.strMeasure5,
    this.strMeasure6, 
    this.strMeasure7, 
    this.strMeasure8, 
    this.strMeasure9, 
    this.strMeasure10, 
    this.strMeasure11,
    this.strMeasure12, 
    this.strMeasure13, 
    this.strMeasure14,
    this.strMeasure15,
    this.ingredienti 
  );

  DettaglioDrink.fromJson(Map<String, dynamic> json) {
    idDrink = json['idDrink'];
    strDrink = json['strDrink'];
    strDrinkThumb = json['strDrinkThumb'];
    strCategory = json['strCategory'];
    strAlcoholic = json['strAlcoholic'];
    strGlass = json['strGlass'];
    strInstructionsIT = json['strInstructionsIT'];
    strIngredient1 = json['strIngredient1'];
    strIngredient2 = json['strIngredient2'];
    strIngredient3 = json['strIngredient3'];
    strIngredient4 = json['strIngredient4'];
    strIngredient5 = json['strIngredient5'];
    strIngredient6 = json['strIngredient6'];
    strIngredient7 = json['strIngredient7'];
    strIngredient8 = json['strIngredient8'];
    strIngredient9 = json['strIngredient9'];
    strIngredient10 = json['strIngredient10'];
    strIngredient11 = json['strIngredient11'];
    strIngredient12 = json['strIngredient12'];
    strIngredient13 = json['strIngredient13'];
    strIngredient14 = json['strIngredient14'];
    strIngredient15 = json['strIngredient15'];
    strMeasure1 = json['strMeasure1'];
    strMeasure2 = json['strMeasure2'];
    strMeasure3 = json['strMeasure3'];
    strMeasure4 = json['strMeasure4'];
    strMeasure5 = json['strMeasure5'];
    strMeasure6 = json['strMeasure6'];
    strMeasure7 = json['strMeasure7'];
    strMeasure8 = json['strMeasure8'];
    strMeasure9 = json['strMeasure9'];
    strMeasure10 = json['strMeasure10'];
    strMeasure11 = json['strMeasure11'];
    strMeasure12 = json['strMeasure12'];
    strMeasure13 = json['strMeasure13'];
    strMeasure14 = json['strMeasure14'];
    strMeasure15 = json['strMeasure15'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idDrink'] = this.idDrink;
    data['strDrink'] = this.strDrink;
    data['strDrinkThumb'] = this.strDrinkThumb;
    data['strCategory'] = this.strCategory;
    data['strAlcoholic'] = this.strAlcoholic;
    data['strGlass'] = this.strGlass;
    data['strInstructionsIT'] = this.strInstructionsIT;
    data['strIngredient1'] = this.strIngredient1;
    data['strIngredient2'] = this.strIngredient2;
    data['strIngredient3'] = this.strIngredient3;
    data['strIngredient4'] = this.strIngredient4;
    data['strIngredient5'] = this.strIngredient5;
    data['strIngredient6'] = this.strIngredient6;
    data['strIngredient7'] = this.strIngredient7;
    data['strIngredient8'] = this.strIngredient8;
    data['strIngredient9'] = this.strIngredient9;
    data['strIngredient10'] = this.strIngredient10;
    data['strIngredient11'] = this.strIngredient11;
    data['strIngredient12'] = this.strIngredient12;
    data['strIngredient13'] = this.strIngredient13;
    data['strIngredient14'] = this.strIngredient14;
    data['strIngredient15'] = this.strIngredient15;
    return data;
  }
}