import 'package:get_it/get_it.dart';

import '../core/core.dart';
import '../features/home/home.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  // BloC
  locator.registerFactory(() => MealsBloc(useCase: locator()));

  // Domain
  locator.registerLazySingleton<DioClient>(() => DioClient());
  locator.registerLazySingleton<MealRemoteDataSource>(
    () => MealRemoteDataSourceImpl(
      client: locator(),
    ),
  );
  locator.registerLazySingleton<MealRepository>(
    () => MealRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );
  locator.registerLazySingleton(
    () => GetMealsUseCase(repository: locator()),
  );
}
