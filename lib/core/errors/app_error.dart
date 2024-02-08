abstract class IAppError {
  String getError(String errorMessage);
}

class DefaultAppError extends IAppError {
  final String _message;
  DefaultAppError(this._message);

  @override
  String getError(String errorMessage) => _message;
}
