class AppException implements Exception {
  final String? _message;
  final String? _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "${_prefix ?? ''}${_message ?? ''}";
  }
}

class FetchDataException extends AppException {
  FetchDataException({required String message}) : super(message, "");
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "");
}

class UnProcessableEntity extends AppException {
  UnProcessableEntity([String? message]) : super(message, "");
}

class UnAuthorisedException extends AppException {
  UnAuthorisedException([String? message]) : super(message, "");
}

class ForbiddenException extends AppException {
  ForbiddenException([String? message]) : super(message, "");
}

class InvalidInputException extends AppException {
  InvalidInputException({required String message}) : super(message, "");
}
