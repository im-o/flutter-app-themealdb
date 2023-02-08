import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../home.dart';

class MealRepositoryImpl implements MealRepository {
  const MealRepositoryImpl({required this.remoteDataSource});

  final MealRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, PaginationData<List<MealModel>>>> getMeals(
      String query) async {
    try {
      final result = await remoteDataSource.getMeals(query);
      return Right(PaginationData(data: result));
    } catch (e) {
      return Left(e.toFailure());
    }
  }

  @override
  Future<Either<Failure, PaginationData<List<MealModel>>>> getMealDetail(
      String id) async {
    try {
      final result = await remoteDataSource.getMealDetail(id);
      return Right(PaginationData(data: result));
    } catch (e) {
      return Left(e.toFailure());
    }
  }
}
