import 'package:dio/dio.dart';

import '../../../../core/core.dart';
import '../../home.dart';

abstract class MealRemoteDataSource {
  Future<List<MealModel>> getMeals(String query);
}

class MealRemoteDataSourceImpl implements MealRemoteDataSource {
  const MealRemoteDataSourceImpl({required this.client});

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
}
