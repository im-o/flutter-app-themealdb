import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class MovieItemCard extends StatelessWidget {
  final MealModel meal;
  final Function onTapMovie;

  const MovieItemCard({
    Key? key,
    required this.meal,
    required this.onTapMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        children: [
          const SizedBox(height: Dimens.dp8),
          Card(
            elevation: Dimens.dp3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Dimens.dp8),
            ),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: MovieImage(meal: meal),
          ),
          const SizedBox(height: Dimens.dp8),
          RegularText(
            meal.strMeal ?? "",
            align: TextAlign.justify,
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: Dimens.dp8),
        ],
      ),
      onTap: () {
        onTapMovie();
      },
    );
  }
}
