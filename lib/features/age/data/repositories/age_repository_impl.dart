import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/features/age/data/datasources/local_data_source/local_datasource/age/i_age_local_datasource.dart';
import 'package:streage/features/age/domain/models/age_model.dart';
import 'package:streage/features/age/domain/repositories/age/i_age_repository.dart';
import 'package:streage/features/age/domain/usecases/params/create_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/delete_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/update_age_param.dart';

class AgeRepositoryImpl implements IAgeRepository {
  final IAgeLocalDataSource _ageDataSource;

  AgeRepositoryImpl(this._ageDataSource);

  @override
  Future<Either<IBaseAppError, AgeModel>> createAge(CreateAgeParam param) {
    final age = AgeModel.fromCreateAgeParam(param: param);
    return _ageDataSource.createAge(age);
  }

  @override
  Future<Either<IBaseAppError, void>> deleteAge(DeleteAgeParam param) {
    return _ageDataSource.deleteAge(param.id);
  }

  @override
  Future<Either<IBaseAppError, List<AgeModel?>>> getAges() {
    return _ageDataSource.getAgeData();
  }

  @override
  Future<Either<IBaseAppError, AgeModel>> updateAge(UpdateAgeParam param) {
    final age = AgeModel.fromUpdateAgeParam(param: param);
    return _ageDataSource.updateAgeData(age);
  }
}
