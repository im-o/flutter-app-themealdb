import 'package:dio/dio.dart';

import '../core.dart';

extension DioErrorExtension on DioError {
  ServerException toServerException() {
    final _meta = ((response?.data ?? {}) as Map)['meta'] != null
        ? MetaData.fromJson(((response?.data ?? {}) as Map)['meta'])
        : null;

    switch (type) {
      case DioErrorType.response:
        switch (response?.statusCode) {
          case 401:
            return UnAuthenticationServerException(
                message: _meta?.message ?? message, code: 401);
          case 403:
            return ForbiddenServerException(
                message: _meta?.message ?? message, code: 403);
          case 404:
            return NotFoundServerException(
                message: _meta?.message ?? message, code: 404);
          case 500:
          case 502:
            return InternalServerException(
                message: _meta?.message ?? message, code: 500);
          default:
            return GeneralServerException(
                message: _meta?.message ?? message, code: response?.statusCode);
        }
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return const TimeOutServerException();
      default:
    }
    return GeneralServerException(message: message);
  }
}
