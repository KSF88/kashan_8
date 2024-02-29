class AppExceptions implements Exception {
  AppExceptions({this.preFix, this.message});

  final message;
  final preFix;

  String toString() {
    return "$preFix $message";
  }
}

class FetchDataException extends AppExceptions {
  FetchDataException([String? message]) : super(message: "Communication error");
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super(message: "Invalid request");
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message]) : super(message: "unAuthorizedRequest request");
}
class InvalidInputException extends AppExceptions {
  InvalidInputException([String? message]) : super(message: "Invalid input");
}


