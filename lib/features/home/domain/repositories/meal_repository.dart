import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';

abstract class MealRepository {
  Future<Either<Failure, PaginationData<List<MealModel>>>> getMeals(
    String query,
  );

  Future<Either<Failure, PaginationData<List<MealModel>>>> getMealDetail(
      String id);
}
