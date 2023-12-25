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
import 'features/age/data/datasources/local_data_source/local_datasource/age/i_age_local_datasource.dart'
    as _i10;
import 'features/age/data/datasources/local_data_source/local_datasource/age/isar_age_local_datasource_imp.dart'
    as _i11;
import 'features/age/data/repositories/age_repository_impl.dart' as _i13;
import 'features/age/domain/repositories/age/i_age_repository.dart' as _i12;
import 'features/age/domain/usecases/age_usecase/create_age_usecase.dart'
    as _i5;
import 'features/age/domain/usecases/age_usecase/delete_age_usecase.dart'
    as _i6;
import 'features/age/domain/usecases/age_usecase/read_age_uscase.dart' as _i8;
import 'features/age/domain/usecases/age_usecase/update_age_usecase.dart'
    as _i7;
import 'features/age/presentation/cubit/age_cubit.dart' as _i3;
import 'features/age/presentation/cubit/age_state.dart' as _i4;

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
    gh.singleton<_i3.AgeCubit>(_i3.AgeCubit(
      gh<_i4.AgeState>(),
      gh<_i5.CreateAgeUsecase>(),
      gh<_i6.DeleteAgeUsecase>(),
      gh<_i7.UpdateAgeUsecase>(),
      gh<_i8.ReadAgeUsecase>(),
    ));
    gh.singleton<_i9.IsarService>(_i9.IsarService());
    gh.singleton<_i10.IAgeLocalDataSource>(
        _i11.IsarAgeLocalDataSource(gh<_i9.IsarService>()));
    gh.lazySingleton<_i12.IAgeRepository>(
        () => _i13.AgeRepositoryImpl(gh<_i10.IAgeLocalDataSource>()));
    return this;
  }
}
