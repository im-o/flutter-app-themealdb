import '../core.dart';

class CodeFailure extends Failure {
  const CodeFailure({required String message, Object? code})
      : super(message: message, code: code);
}

extension CodeFailureX on Object {
  Failure toFailure() {
    if (this is ServerException) {
      return (this as ServerException).toFailure();
    } else if (this is CacheException) {
      return (this as CacheException).toFailure();
    } else if (this is CodeException) {
      return (this as CodeException).toFailure();
    } else {
      return CodeFailure(message: toString());
    }
  }
}
