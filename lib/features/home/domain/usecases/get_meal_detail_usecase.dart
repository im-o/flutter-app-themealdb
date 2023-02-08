import 'dart:async';

import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class GetMealDetailUseCase
    implements UseCaseFuture<Failure, PaginationData<List<MealModel>>, String> {
  const GetMealDetailUseCase({required this.repository});

  final MealRepository repository;

  @override
  FutureOr<Either<Failure, PaginationData<List<MealModel>>>> call(
      String params) {
    return repository.getMealDetail(params);
  }
}
