import '../failures/base.dart';
import '../failures/cache_failure.dart';

class CacheException implements Exception {
  const CacheException({required this.message, this.code});

  final String message;
  final Object? code;
}

/// Throws when cache is empty or not found
///
class NotFoundCacheException extends CacheException {
  const NotFoundCacheException({
    String message = 'Cache not found',
    Object? code,
  }) : super(
          message: message,
          code: code,
        );
}

/// Throw when cache is expired
class ExpiredCacheException extends CacheException {
  const ExpiredCacheException({
    String message = 'The cache can no longer be used because it has expired',
    Object? code,
  }) : super(
          message: message,
          code: code,
        );
}

extension CacheExceptionX on CacheException {
  Failure toFailure() {
    return CacheFailure(message: message, code: code);
  }
}
