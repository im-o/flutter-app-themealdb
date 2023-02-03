import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../home.dart';

abstract class MealRemoteDataSource {
  Future<List<MealModel>> getMeals(String query);

  Future<List<MealModel>> getMealDetail(String id);
}

class MealRemoteDataSourceImpl implements MealRemoteDataSource {
  const MealRemoteDataSourceImpl(this.client);

  final DioClient client;

  @override
  Future<List<MealModel>> getMeals(String query) async {
    try {
      final response = await client.dio.get(
        'search.php',
        queryParameters: {"s": query},
      );

      return MealResponseModel.fromJson(response.data).meals ?? [];
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }

  @override
  Future<List<MealModel>> getMealDetail(String id) async {
    try {
      final response = await client.dio.get(
        'lookup.php',
        queryParameters: {"i": id},
      );

      return MealResponseModel.fromJson(response.data).meals ?? [];
    } on DioError catch (e) {
      throw e.toServerException();
    }
  }
}
