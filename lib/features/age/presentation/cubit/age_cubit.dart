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
  final dateStream = StreamController<List<int>>();
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
      state.add(age);
      emit(state);
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
    }
    dateStream.close();
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
    final age = state.first!;
    DateTime birthDate = DateTime(age.years, age.months, age.days, age.hours,
        age.minutes, age.seconds, age.milliseconds, age.microseconds);

    Timer.periodic(const Duration(microseconds: 1), (timer) {
      final now = DateTime.now();

      Duration difference = now.difference(birthDate);
      final year = difference.inDays ~/ 365;
      int remainingDays = difference.inDays % 365;
      final month = remainingDays ~/ 30;
      remainingDays = remainingDays % 30;
      final day = remainingDays;
      final hour = difference.inHours % 24;
      final minute = difference.inMinutes % 60;
      final second = difference.inSeconds % 60;
      final millisecond = difference.inMilliseconds % 1000;
      final microsecond = difference.inMicroseconds % 1000;
      dateStream.add(
          [year, month, day, hour, minute, second, millisecond, microsecond]);
    });
    return dateStream.stream;
  }
}
