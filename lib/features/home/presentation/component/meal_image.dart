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
              ? _emptyImage(null)
              : CachedNetworkImage(
                  imageUrl: meal.strMealThumb ?? '',
                  placeholder: (context, url) => _emptyImage(
                    const CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => _emptyImage(
                    const Icon(Icons.error),
                  ),
                ),
        ),
      ],
    );
  }
}
