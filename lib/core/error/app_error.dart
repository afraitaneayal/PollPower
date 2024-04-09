abstract class IAppError {
  String getError(String errorMessage);
}

class GenericAppError extends IAppError {
  final String _message;
  GenericAppError(this._message);

  @override
  String getError(String errorMessage) => _message;
}

class FailedToSignupUser extends GenericAppError {
  FailedToSignupUser(super.message);
}

class FailedToLogUser extends GenericAppError {
  FailedToLogUser(super.message);
}
