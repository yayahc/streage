import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:streage/features/age/domain/models/age_model.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/create_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/delete_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/update_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/params/create_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/delete_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/update_age_param.dart';

class AgeCubit extends Cubit<List<AgeModel?>> {
  final CreateAgeUsecase _createAgeUsecase;
  final DeleteAgeUsecase _deleteAgeUsecase;
  final UpdateAgeUsecase _updateAgeUsecase;
  AgeCubit(super.initialState, this._createAgeUsecase, this._deleteAgeUsecase,
      this._updateAgeUsecase);

  Future<void> createAge(DateTime? date, TimeOfDay? time) async {
    final param = CreateAgeParam(
        years: date!.year,
        months: date.month,
        days: date.day,
        hours: time!.hour,
        minutes: time.minute,
        seconds: 0,
        milliseconds: 0,
        microseconds: 0);
    final ageTrigger = await _createAgeUsecase.trigger(param);
    if (ageTrigger.isRight()) {
      final age = ageTrigger.fold((l) => null, (r) => r);
      final ageState = [...state, age];
      emit(ageState);
    } else {
      /// [TODO] print error with scafold snackbar.
      final error = ageTrigger.fold((l) => l, (r) => null);
      debugPrint(error?.getError());
    }
  }

  Future<void> deleteAge(Id id) async {
    final param = DeleteAgeParam(id: id);
    final ageTrigger = await _deleteAgeUsecase.trigger(param);
    if (ageTrigger.isLeft()) {
      /// [TODO] print error with scafold snackbar.
      final error = ageTrigger.fold((l) => l, (r) => null);
      debugPrint(error?.getError());
    } else {
      final ages = state.where((element) => element?.id != param.id).toList();
      emit(ages);
    }
  }

  Future<void> updateAge(UpdateAgeParam param) async {
    final ageTrigger = await _updateAgeUsecase.trigger(param);
    if (ageTrigger.isLeft()) {
      /// [TODO] print error with scafold snackbar.
      final error = ageTrigger.fold((l) => l, (r) => null);
      debugPrint(error?.getError());
    }
  }

  Stream<List<int>> ageStream() {
    late StreamController<List<int>> dateStream = StreamController<List<int>>();

    final age = state.first!;
    DateTime birthDate = DateTime(age.years, age.months, age.days);

    Timer.periodic(const Duration(microseconds: 1), (timer) {
      final now = DateTime.now();

      // Calculate years
      int year = now.year - birthDate.year;
      if (now.month < birthDate.month ||
          (now.month == birthDate.month && now.day < birthDate.day)) {
        year--;
      }

      // Calculate days
      int day = now.day - birthDate.day;

      // Calculate months
      int month;
      switch (now.month - birthDate.month) {
        case int n when n > 0:
          month = now.month - birthDate.month;
          break;
        case int n when n < 0:
          month = now.month - birthDate.month + 12;
          break;
        default:
          if (day < 0) {
            final daysInLastMonth = DateTime(now.year, now.month, 0).day;
            month = 11;
            day = daysInLastMonth + day;
          } else {
            month = 0;
          }
      }

      // Calculate time
      int hour = now.hour - birthDate.hour;
      int minute = now.minute - birthDate.minute;
      int second = now.second - birthDate.second;
      int millisecond = now.millisecond - birthDate.millisecond;
      int microsecond = now.microsecond - birthDate.microsecond;

      dateStream.add(
          [year, month, day, hour, minute, second, millisecond, microsecond]);
    });

    return dateStream.stream;
  }
}
