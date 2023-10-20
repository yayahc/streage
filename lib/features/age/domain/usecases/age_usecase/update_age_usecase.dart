import 'package:dartz/dartz.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/core/helper/usecases/usecase.dart';
import 'package:streage/features/age/domain/models/age_model.dart';
import 'package:streage/features/age/domain/repositories/age/i_age_repository.dart';
import 'package:streage/features/age/domain/usecases/params/update_age_param.dart';

class UpdateAgeUsecase implements Usecase<UpdateAgeParam, AgeModel> {
  final IAgeRepository _ageRepository;

  UpdateAgeUsecase(this._ageRepository);

  @override
  Future<Either<IBaseAppError, AgeModel>> trigger(UpdateAgeParam param) {
    return _ageRepository.updateAge(param);
  }
}
