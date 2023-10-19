import 'package:dartz/dartz.dart';
import 'package:streage/core/errors/i_base_app_error.dart';

/// Usecase is means to possible actions
/// [P] means parameters
/// [R] means responses
/// We passe a param [P] and expect to get a respons [R]

abstract class Usecase<P, R> {
  Future<Either<IBaseAppError, R>> trigger(P param);
}
