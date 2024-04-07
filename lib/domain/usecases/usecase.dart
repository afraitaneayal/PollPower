import 'package:dartz/dartz.dart';

import '../../core/common/error/errors.dart';

abstract class Usecase<Param, T> {
  Future<Either<AppError, T?>> trigger(Param param);
}
