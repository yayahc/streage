// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/services/isar/isar_service.dart' as _i3;
import 'features/age/data/datasources/local_data_source/local_datasource/age/i_age_local_datasource.dart'
    as _i4;
import 'features/age/data/datasources/local_data_source/local_datasource/age/isar_age_local_datasource_imp.dart'
    as _i5;
import 'features/age/data/repositories/age_repository_impl.dart' as _i7;
import 'features/age/domain/repositories/age/i_age_repository.dart' as _i6;

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
    gh.singleton<_i3.IsarService>(_i3.IsarService());
    gh.singleton<_i4.IAgeLocalDataSource>(
        _i5.IsarAgeLocalDataSource(gh<_i3.IsarService>()));
    gh.lazySingleton<_i6.IAgeRepository>(
        () => _i7.AgeRepositoryImpl(gh<_i4.IAgeLocalDataSource>()));
    return this;
  }
}
