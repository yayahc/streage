import 'package:dartz/dartz.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/core/helper/usecases/usecase.dart';
import 'package:streage/features/age/domain/models/age_model.dart';
import 'package:streage/features/age/domain/repositories/age/i_age_repository.dart';
import 'package:streage/features/age/domain/usecases/params/get_age_param.dart';

class GetAgeUsecase implements Usecase<GetAgeParam, List<AgeModel>> {
  final IAgeRepository _ageRepository;
  GetAgeUsecase(this._ageRepository);

  @override
  Future<Either<IBaseAppError, List<AgeModel>>> trigger(param) {
    return _ageRepository.getAge();
  }
}
