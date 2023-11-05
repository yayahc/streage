import 'package:get_it/get_it.dart';
import 'package:streage/core/app_assets/app_assets.dart';
import 'package:streage/core/app_texts/app_text.dart';
import 'package:streage/core/errors/generic_app_error.dart';
import 'package:streage/core/helper/usecases/usecase.dart';
import 'package:streage/features/age/data/datasources/local_data_source/local_datasource/age/isar_age_local_datasource_imp.dart';
import 'package:streage/features/age/data/repositories/age_repository_impl.dart';
import 'package:streage/features/age/domain/controller/age_controller.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/create_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/delete_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/update_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/params/create_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/delete_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/update_age_param.dart';
import 'package:streage/features/age/services/isar/isar_service.dart';

Future<void> injectDependencies(GetIt locator, IsarService isarService) async {
  // singleton
  locator.registerSingleton(Usecase);
  locator.registerSingleton(UpdateAgeParam(
      id: 0,
      years: 0,
      months: 0,
      days: 0,
      hours: 0,
      minutes: 0,
      seconds: 0,
      milliseconds: 0,
      microseconds: 0));
  locator.registerSingleton(CreateAgeParam(
      years: 0,
      months: 0,
      days: 0,
      hours: 0,
      minutes: 0,
      seconds: 0,
      milliseconds: 0,
      microseconds: 0));
  locator.registerSingleton(DeleteAgeParam(
    id: 0,
  ));
  locator.registerSingleton(AgeController());
  locator.registerSingleton(AppAssets());
  locator.registerSingleton(AppTexts());
  locator.registerSingleton(IsarAgeLocalDataSource(isarService));

  // lazy singleton
  locator.registerLazySingleton(() => GenericAppError('_message'));
  locator.registerLazySingleton(
      () => AgeRepositoryImpl(IsarAgeLocalDataSource(isarService)));
  locator.registerLazySingleton(() =>
      UpdateAgeUsecase(AgeRepositoryImpl(IsarAgeLocalDataSource(isarService))));
  locator.registerLazySingleton(() =>
      DeleteAgeUsecase(AgeRepositoryImpl(IsarAgeLocalDataSource(isarService))));
  locator.registerLazySingleton(() =>
      CreateAgeUsecase(AgeRepositoryImpl(IsarAgeLocalDataSource(isarService))));
}
