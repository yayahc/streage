import 'package:dartz/dartz.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/core/helper/usecases/usecase.dart';
import 'package:streage/features/age/domain/models/entities/age.dart';
import 'package:streage/features/age/domain/repositories/age/i_age_repository.dart';
import 'package:streage/features/age/domain/usecases/params/create_age_param.dart';

class GetAgeUsecase implements Usecase<CreateAgeParam, Age> {
  final IAgeRepository _ageRepository;
  GetAgeUsecase(this._ageRepository);

  @override
  Future<Either<IBaseAppError, Age>> trigger(param) {
    return _ageRepository.createAge(param);
  }
}
