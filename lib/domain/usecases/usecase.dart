import 'package:dartz/dartz.dart';

import '../../core/error/app_error.dart';

abstract class Usecase<Param, T> {
  Future<Either<IAppError, T?>> trigger(Param param);
}
