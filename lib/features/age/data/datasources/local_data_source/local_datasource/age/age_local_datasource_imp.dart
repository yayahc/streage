import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/features/age/data/datasources/local_data_source/local_datasource/age/i_age_local_datasource.dart';
import 'package:streage/features/age/domain/models/age_model.dart';

class IsarAgeLocalDataSource implements IAgeLocalDataSource {
  @override
  Future<Either<IBaseAppError, void>> createAge(AgeModel param) {
    throw UnimplementedError();
  }

  @override
  Future<Either<IBaseAppError, void>> deleteAge(Id id) {
    throw UnimplementedError();
  }

  @override
  Future<Either<IBaseAppError, AgeModel>> getAgeData() {
    throw UnimplementedError();
  }

  @override
  Future<Either<IBaseAppError, void>> updateAgeData(AgeModel param) {
    throw UnimplementedError();
  }
}
