import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/core/helper/usecases/usecase.dart';
import 'package:streage/features/age/domain/repositories/age/i_age_repository.dart';
import 'package:streage/features/age/domain/usecases/params/delete_age_param.dart';

@Singleton()
class DeleteAgeUsecase implements Usecase<DeleteAgeParam, void> {
  final IAgeRepository _ageRepository;

  DeleteAgeUsecase(this._ageRepository);

  @override
  Future<Either<IBaseAppError, void>> trigger(DeleteAgeParam param) {
    return _ageRepository.deleteAge(param);
  }
}
