import '../core.dart';

class CodeException implements Exception {
  const CodeException({required this.message, this.code});

  final String message;
  final Object? code;
}

extension CodeExceptionX on CodeException {
  Failure toFailure() {
    return CodeFailure(message: message, code: code);
  }
}
