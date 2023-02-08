import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class MealItemCard extends StatelessWidget {
  final MealModel meal;
  final Function onTapMeal;

  const MealItemCard({
    Key? key,
    required this.meal,
    required this.onTapMeal,
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
            child: MealImage(meal: meal),
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
        onTapMeal();
      },
    );
  }
}
