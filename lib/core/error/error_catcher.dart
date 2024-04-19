import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'app_error.dart';

class ErrorCatcher {
  static Future<Either<IAppError, T>> tryCatch<T>(Future<T> fn) async {
    try {
      final result = await fn;
      return right(result);
    } catch (e, stackTrace) {
      log(stackTrace.toString());
      if (e is IAppError) {
        return left(e);
      }
      return left(GenericAppError(e.toString()));
    }
  }

  static Future<T> networkCatch<T>(Future<T> fn) async {
    try {
      final r = await fn;
      return r;
    } catch (e) {
      throw NoInternetError();
    }
  }
}
