import 'package:flutter/material.dart';

import '../../../home.dart';
import 'sections/sections.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({Key? key, required this.meal}) : super(key: key);

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.strMeal.toString()),
      ),
      body: MealDetailSection(meal: meal),
    );
  }
}
