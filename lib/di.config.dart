// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/services/isar/isar_service.dart' as _i9;
import 'core/ui/theme/color/default_app_color.dart' as _i4;
import 'core/ui/theme/color/i_app_color.dart' as _i3;
import 'core/ui/theme/size/default_app_size.dart' as _i6;
import 'core/ui/theme/size/i_app_size.dart' as _i5;
import 'core/ui/theme/typo/default_app_typography.dart' as _i8;
import 'core/ui/theme/typo/i_app_typography.dart' as _i7;
import 'features/age/data/datasources/local_data_source/local_datasource/age/i_age_local_datasource.dart'
    as _i10;
import 'features/age/data/datasources/local_data_source/local_datasource/age/isar_age_local_datasource_imp.dart'
    as _i11;
import 'features/age/data/repositories/age_repository_impl.dart' as _i13;
import 'features/age/domain/repositories/age/i_age_repository.dart' as _i12;
import 'features/age/domain/usecases/age_usecase/create_age_usecase.dart'
    as _i16;
import 'features/age/domain/usecases/age_usecase/delete_age_usecase.dart'
    as _i17;
import 'features/age/domain/usecases/age_usecase/read_age_uscase.dart' as _i14;
import 'features/age/domain/usecases/age_usecase/update_age_usecase.dart'
    as _i15;
import 'features/age/presentation/cubit/age_cubit.dart' as _i18;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.IAppColor>(_i4.DefaultAppColor());
    gh.singleton<_i5.IAppSize>(_i6.DefaultAppSize());
    gh.singleton<_i7.IAppTypography>(_i8.DefaultAppTypography());
    gh.singleton<_i9.IsarService>(_i9.IsarService());
    gh.singleton<_i10.IAgeLocalDataSource>(
        _i11.IsarAgeLocalDataSource(gh<_i9.IsarService>()));
    gh.lazySingleton<_i12.IAgeRepository>(
        () => _i13.AgeRepositoryImpl(gh<_i10.IAgeLocalDataSource>()));
    gh.singleton<_i14.ReadAgeUsecase>(
        _i14.ReadAgeUsecase(gh<_i12.IAgeRepository>()));
    gh.singleton<_i15.UpdateAgeUsecase>(
        _i15.UpdateAgeUsecase(gh<_i12.IAgeRepository>()));
    gh.singleton<_i16.CreateAgeUsecase>(
        _i16.CreateAgeUsecase(gh<_i12.IAgeRepository>()));
    gh.singleton<_i17.DeleteAgeUsecase>(
        _i17.DeleteAgeUsecase(gh<_i12.IAgeRepository>()));
    gh.singleton<_i18.AgeCubit>(_i18.AgeCubit(
      gh<_i16.CreateAgeUsecase>(),
      gh<_i17.DeleteAgeUsecase>(),
      gh<_i15.UpdateAgeUsecase>(),
      gh<_i14.ReadAgeUsecase>(),
    ));
    return this;
  }
}
