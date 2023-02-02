class MealModel {
  MealModel({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
  });

  MealModel.fromJson(dynamic json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strDrinkAlternate = json['strDrinkAlternate'];
    strCategory = json['strCategory'];
    strArea = json['strArea'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    strTags = json['strTags'];
  }

  String? idMeal;
  String? strMeal;
  String? strDrinkAlternate;
  String? strCategory;
  String? strArea;
  String? strInstructions;
  String? strMealThumb;
  String? strTags;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['idMeal'] = idMeal;
    map['strMeal'] = strMeal;
    map['strDrinkAlternate'] = strDrinkAlternate;
    map['strCategory'] = strCategory;
    map['strArea'] = strArea;
    map['strInstructions'] = strInstructions;
    map['strMealThumb'] = strMealThumb;
    map['strTags'] = strTags;
    return map;
  }
}
