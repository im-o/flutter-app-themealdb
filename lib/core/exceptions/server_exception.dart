import '../core.dart';

/// ## Reference Error Message:
/// https://www.ibm.com/docs/nl/qradar-common?topic=overview-api-error-messages
///
abstract class ServerException implements Exception {
  const ServerException({required this.message, this.code});

  final String message;
  final Object? code;
}

class GeneralServerException extends ServerException {
  const GeneralServerException({
    required String message,
    Object? code,
  }) : super(
          message: message,
          code: code,
        );
}

class TimeOutServerException extends ServerException {
  const TimeOutServerException({
    String message = 'Connection to the server has timed out',
    Object? code,
  }) : super(
          message: message,
          code: code,
        );
}

class NotFoundServerException extends ServerException {
  const NotFoundServerException({
    String message = 'We could not find the resource you requested. '
        'Please refer to the documentation for the list of resources.',
    Object? code = 404,
  }) : super(
          message: message,
          code: code,
        );
}

class UnAuthenticationServerException extends ServerException {
  const UnAuthenticationServerException({
    String message =
        'You are unauthorized to access the requested resource. Please log in.',
    Object? code = 401,
  }) : super(
          message: message,
          code: code,
        );
}

class ForbiddenServerException extends ServerException {
  const ForbiddenServerException({
    String message =
        'Your account is not authorized to access the requested resource.',
    Object? code = 403,
  }) : super(
          message: message,
          code: code,
        );
}

class InternalServerException extends ServerException {
  const InternalServerException({
    String message = 'Unexpected internal server error.',
    Object? code = 500,
  }) : super(
          message: message,
          code: code,
        );
}

extension ServerExceptionX on ServerException {
  Failure toFailure() {
    return ServerFailure(message: message, code: code);
  }
}
