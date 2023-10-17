import 'package:cached_network_image/cached_network_image.dart';
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

  Widget _emptyImage(Widget? widget) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: constraints.maxWidth > 700 ? 150 : 100,
        child: Container(
          alignment: Alignment.center,
          child: widget ?? const Text('No Image'),
        ),
      );
    });
  }
}
