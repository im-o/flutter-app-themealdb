import 'package:flutter_app_dicoding/features/home/data/data_source/remote_data_source.dart';

import '../../data/data.dart';

class HomeRepository {
  const HomeRepository({required this.remoteDataSource});

  final HomeRemoteDataSource remoteDataSource;

  Future<List<MealModel>> getMeals(String query) async {
    return await remoteDataSource.getMeals(query);
  }

  Future<List<MealModel>> getMealDetail(String id) async {
    return await remoteDataSource.getMealDetail(id);
  }
}
