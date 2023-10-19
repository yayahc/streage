import 'package:dartz/dartz.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/features/age/domain/models/age_model.dart';

abstract class IAgeRepository {
  Future<Either<IBaseAppError, DateTime>> getAge();

  Future<Either<IBaseAppError, AgeModel>> createAge();

  Future<Either<IBaseAppError, AgeModel>> updateAge();

  Future<Either<IBaseAppError, void>> deleteAge();
}
