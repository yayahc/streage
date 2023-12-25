import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:streage/core/errors/generic_app_error.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/features/age/data/datasources/local_data_source/local_datasource/age/i_age_local_datasource.dart';
import 'package:streage/features/age/domain/models/age_model.dart';
import 'package:streage/core/services/isar/isar_service.dart';

@Singleton(as: IAgeLocalDataSource)
class IsarAgeLocalDataSource implements IAgeLocalDataSource {
  final IsarService _isarService;
  IsarAgeLocalDataSource(this._isarService);

  @override
  Future<Either<IBaseAppError, AgeModel>> createAge(AgeModel param) async {
    try {
      // Create age
      final age = AgeModel.createAge(
          id: Isar.autoIncrement,
          years: param.years,
          months: param.months,
          days: param.days,
          hours: param.hours,
          minutes: param.minutes,
          seconds: param.seconds,
          milliseconds: param.milliseconds,
          microseconds: param.microseconds);

      // Save in async the age on the db
      await _isarService.createAge(age);
      return right(age);
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return left(GenericAppError(e.toString()));
    }
  }

  @override
  Future<Either<IBaseAppError, void>> deleteAge(Id id) async {
    try {
      await _isarService.deleteAge(id);
      return right(null);
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return left(GenericAppError(e.toString()));
    }
  }

  @override
  Future<Either<IBaseAppError, AgeModel>> updateAgeData(AgeModel param) async {
    try {
      // Update element that have param.id
      await _isarService.updateAge(param);
      return right(param);
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return left(GenericAppError(e.toString()));
    }
  }

  @override
  Future<Either<IBaseAppError, AgeModel?>> getAgeInfo(int id) async {
    try {
      final age = await _isarService.getAge(id);
      return right(age);
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return left(GenericAppError(e.toString()));
    }
  }

  @override
  Future<Either<IBaseAppError, List<AgeModel?>>> getAgesData() async {
    try {
      final age = await _isarService.getAges();
      return right(age);
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return left(GenericAppError(e.toString()));
    }
  }
}
