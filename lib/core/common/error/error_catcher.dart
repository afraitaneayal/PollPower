import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'errors.dart';

class ErrorCatcher {
  static Future<Either<AppError, T>> tryCatch<T>(Future<T> fn) async {
    try {
      final result = await fn;
      return right(result);
    } catch (e, stackTrace) {
      final error = e.toString();
      log(error);
      return left(GenericAppError(stackTrace.toString()));
    }
  }
}
