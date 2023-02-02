import '../../../home.dart';

class MealResponseModel {
  List<MealModel>? meals;

  MealResponseModel({
    this.meals,
  });

  MealResponseModel.fromJson(dynamic json) {
    if (json['meals'] != null) {
      meals = [];
      json['meals'].forEach((v) {
        meals?.add(MealModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (meals != null) {
      map['meals'] = meals?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
