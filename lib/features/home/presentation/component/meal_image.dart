import 'package:flutter/material.dart';

import '../../home.dart';

class MealImage extends StatelessWidget {
  final MealModel meal;

  const MealImage({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: meal.strMealThumb == null
              ? const Icon(Icons.movie_outlined)
              : Image.network(
                  meal.strMealThumb ?? "",
                  fit: BoxFit.fitWidth,
                ),
        ),
      ],
    );
  }
}
