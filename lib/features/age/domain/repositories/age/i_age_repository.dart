import 'package:dartz/dartz.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/features/age/domain/models/age_model.dart';
import 'package:streage/features/age/domain/usecases/params/create_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/delete_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/update_age_param.dart';

abstract class IAgeRepository {
  Future<Either<IBaseAppError, AgeModel>> getAge();

  Future<Either<IBaseAppError, void>> createAge(CreateAgeParam param);

  Future<Either<IBaseAppError, void>> updateAge(UpdateAgeParam param);

  Future<Either<IBaseAppError, void>> deleteAge(DeleteAgeParam param);
}
