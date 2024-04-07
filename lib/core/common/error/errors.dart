abstract class AppError {
  String getError();
}

class GenericAppError extends AppError {
  final String error;
  GenericAppError(this.error);

  @override
  String getError() {
    return error;
  }
}
