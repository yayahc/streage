import 'package:dartz/dartz.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/core/helper/usecases/usecase.dart';
import 'package:streage/features/age/domain/repositories/age/i_age_repository.dart';
import 'package:streage/features/age/domain/usecases/params/create_age_param.dart';

class CreateAgeUsecase implements Usecase<CreateAgeParam, void> {
  final IAgeRepository _ageRepository;
  CreateAgeUsecase(this._ageRepository);

  @override
  Future<Either<IBaseAppError, void>> trigger(CreateAgeParam param) {
    return _ageRepository.createAge(param);
  }
}
