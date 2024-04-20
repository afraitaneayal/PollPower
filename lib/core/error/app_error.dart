abstract class IAppError {
  String getError();
}

class GenericAppError extends IAppError {
  final String _message;
  GenericAppError(this._message);

  @override
  String getError() => _message;
}

class BadRequestError extends IAppError {
  final String _error;
  BadRequestError(this._error);

  @override
  String getError() => _error;
}

class NoInternetError extends GenericAppError {
  NoInternetError() : super("Check your internet");
}

class UserNotFoundError extends GenericAppError {
  UserNotFoundError() : super("User not found");
}

class InternlaError extends GenericAppError {
  InternlaError() : super("Something went wrong please try again");
}
