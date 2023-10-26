import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/features/age/domain/models/age_model.dart';

abstract class IAgeLocalDataSource {
  Future<Either<IBaseAppError, AgeModel?>> getAgeData(Id id);

  Future<Either<IBaseAppError, AgeModel>> createAge(AgeModel param);

  Future<Either<IBaseAppError, AgeModel>> updateAgeData(AgeModel param);

  Future<Either<IBaseAppError, void>> deleteAge(Id id);
}
