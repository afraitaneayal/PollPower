abstract class IAppError {
  String getError(String errorMessage);
}

class GenericAppError extends IAppError {
  final String _message;
  GenericAppError(this._message);

  @override
  String getError(String errorMessage) => _message;
}
