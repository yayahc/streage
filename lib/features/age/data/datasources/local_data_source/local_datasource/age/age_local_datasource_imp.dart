import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:streage/core/errors/generic_app_error.dart';
import 'package:streage/core/errors/i_base_app_error.dart';
import 'package:streage/features/age/data/datasources/local_data_source/local_datasource/age/i_age_local_datasource.dart';
import 'package:streage/features/age/domain/models/age_model.dart';

class IsarAgeLocalDataSource implements IAgeLocalDataSource {
  @override
  Future<Either<IBaseAppError, AgeModel>> createAge(AgeModel param) async {
    try {
      // Check existing age on db then get id
      final ageId = param.id;
      final age = AgeModel.createAge(
          id: ageId,
          years: param.years,
          months: param.months,
          days: param.days,
          hours: param.hours,
          minutes: param.minutes,
          seconds: param.seconds,
          milliseconds: param.milliseconds,
          microseconds: param.microseconds);
      return right(age);
    } catch (e, stackTrace) {
      debugPrintStack(stackTrace: stackTrace);
      return left(GenericAppError(e.toString()));
    }
  }

  @override
  Future<Either<IBaseAppError, void>> deleteAge(Id id) {
    // Get element with right id and delete it
    throw UnimplementedError();
  }

  @override
  Future<Either<IBaseAppError, List<AgeModel>>> getAgeData() {
    // Fetch all age from db
    throw UnimplementedError();
  }

  @override
  Future<Either<IBaseAppError, AgeModel>> updateAgeData(AgeModel param) {
    // Update element that have param.id
    throw UnimplementedError();
  }
}
