import 'package:dio/dio.dart';

import '../core.dart';

class DioClient {
  final dio = createDio();
  final tokenDio = Dio(BaseOptions(baseUrl: basUrl));

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: basUrl,
      receiveTimeout: 15000,
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });

    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return handler.next(response);
  }
}
