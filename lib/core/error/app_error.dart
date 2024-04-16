abstract class IAppError {
  String getError();
}

class GenericAppError extends IAppError {
  final String _message;
  GenericAppError(this._message);

  @override
  String getError() => _message;
}

class NoInternetError extends GenericAppError {
  NoInternetError() : super("Check your internet");
}

class InternlaServerError extends GenericAppError {
  InternlaServerError()
      : super("Something went wrong on the server please try again");
}
