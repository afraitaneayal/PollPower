import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:poll_power/core/extensions/context_extension.dart';
import 'package:poll_power/di.dart';
import 'package:poll_power/presentation/state_management/bloc/auth/auth_bloc.dart';
import 'package:poll_power/router.dart';
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
      throw GenericAppError(e.toString());
    }
  }
}
