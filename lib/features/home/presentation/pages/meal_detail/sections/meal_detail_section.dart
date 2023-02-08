import 'package:flutter/material.dart';

import '../../../../../../core/core.dart';
import '../../../../home.dart';

class MealDetailSection extends StatelessWidget {
  const MealDetailSection({Key? key, required this.meal}) : super(key: key);

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimens.dp16),
          child: Column(
            children: [
              SizedBox(
                width: constraints.maxWidth > 900 ? Dimens.dp500 : Dimens.dp200,
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: constraints.maxWidth > 900
                        ? BorderRadius.circular(Dimens.dp16)
                        : BorderRadius.circular(Dimens.dp8),
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: MealImage(meal: meal),
                ),
              ),
              const SizedBox(height: Dimens.dp16),
              TitleText(
                meal.strMeal ?? "",
                align: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: Dimens.dp8),
              SubTitleText(
                "${meal.strArea} • ${meal.strCategory} • ${meal.strTags}",
                style: const TextStyle(
                  fontSize: Dimens.dp14,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: Dimens.dp16),
              const Divider(thickness: Dimens.dp3),
              const SizedBox(height: Dimens.dp16),
              const SubTitleText('Instructions'),
              const SizedBox(height: Dimens.dp16),
              RegularText(
                meal.strInstructions ?? "",
                align: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.white60,
                ),
              ),
              const SizedBox(height: Dimens.dp16),
            ],
          ),
        ),
      );
    });
  }
}
