class Ingredienti {
  late String strIngredient1;
  late String? image;

  Ingredienti(this.strIngredient1, this.image);

  Ingredienti.fromJson(Map<String, dynamic> json) {
    strIngredient1 = json['strIngredient1'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strIngredient1'] = this.strIngredient1;
    data['image'] = this.image;
    return data;
  }
}