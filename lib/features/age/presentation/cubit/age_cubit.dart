import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:streage/core/extension/context_extension.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/create_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/delete_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/read_age_uscase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/update_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/params/create_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/delete_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/read_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/update_age_param.dart';
import 'package:streage/features/age/presentation/cubit/age_state.dart';
import 'package:streage/router.dart';

@Singleton()
class AgeCubit extends Cubit<AgeState> {
  final CreateAgeUsecase _createAgeUsecase;
  final DeleteAgeUsecase _deleteAgeUsecase;
  final UpdateAgeUsecase _updateAgeUsecase;
  final ReadAgeUsecase _readAgeUsecase;
  AgeCubit(this._createAgeUsecase, this._deleteAgeUsecase,
      this._updateAgeUsecase, this._readAgeUsecase)
      : super(AgeInitial()) {
    fetchAges();
  }

  Future<void> createAge(DateTime? date, TimeOfDay? time) async {
    emit(AgeIsProcessing());
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
      emit(AgeIsDone([age]));
      navKey.currentContext?.push(AppRoutes.home);
    } else {
      final error = ageTrigger.fold((l) => l, (r) => null);
      debugPrint(error?.getError());
      navKey.currentContext
          ?.showSnackBar("Error while creating age, ${error!.getError()}");
    }
  }

  Future<void> deleteAge(Id id) async {
    final param = DeleteAgeParam(id: id);
    final ageTrigger = await _deleteAgeUsecase.trigger(param);
    if (ageTrigger.isLeft()) {
      final error = ageTrigger.fold((l) => l, (r) => null);
      debugPrint(error?.getError());
      navKey.currentContext
          ?.showSnackBar("Error while creating age, ${error!.getError()}");
    } else {
      fetchAges();
    }
  }

  Future<void> updateAge(UpdateAgeParam param) async {
    final ageTrigger = await _updateAgeUsecase.trigger(param);
    if (ageTrigger.isLeft()) {
      final error = ageTrigger.fold((l) => l, (r) => null);
      debugPrint(error?.getError());
      navKey.currentContext
          ?.showSnackBar("Error while creating age, ${error!.getError()}");
    }
  }

  Future<void> fetchAges() async {
    emit(AgeIsProcessing());
    // By default we get current age
    final readAgeParam = ReadAgeParam(0);
    final trigger = await _readAgeUsecase.trigger(readAgeParam);
    if (trigger.isRight()) {
      final ages = trigger.fold((l) => null, (r) => r);
      if (ages == null) {
        emit(AgeIsDone(const []));
      } else {
        emit(AgeIsDone([ages]));
      }
    } else {
      final error = trigger.fold((l) => l, (r) => null);
      debugPrint(error?.getError());
      emit(AgeFailed());
      navKey.currentContext?.showSnackBar(error!.getError());
    }
  }
}
