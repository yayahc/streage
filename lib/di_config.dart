import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:streage/di.dart';
import 'package:streage/features/age/services/isar/isar_service.dart';
import 'features/age/data/datasources/local_data_source/local_datasource/age/isar_age_local_datasource_imp.dart';
import 'features/age/domain/models/age_model.dart';

final locator = GetIt.instance;

FutureOr<List<AgeModel?>> getData() async {
  final initialDataSource = locator.get<IsarAgeLocalDataSource>();
  final initialDataFold = await initialDataSource.getAgeData();
  final initialData = initialDataFold.fold((l) => null, (r) => r)!;
  return initialData;
}

void configureDependencies(IsarService isarService) =>
    injectDependencies(locator, isarService);
