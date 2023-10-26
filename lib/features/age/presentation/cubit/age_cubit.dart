import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:streage/features/age/data/datasources/local_data_source/local_datasource/age/isar_age_local_datasource_imp.dart';
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

  Future<void> createAge(CreateAgeParam param) async {
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

  Future<void> deleteAge(DeleteAgeParam param) async {
    final ageTrigger = await _deleteAgeUsecase.trigger(param);
    if (ageTrigger.isLeft()) {
      /// [TODO] print error with scafold snackbar.
      final error = ageTrigger.fold((l) => l, (r) => null);
      debugPrint(error?.getError());
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

  Stream<DateTime> streamDate() {
    final dateStream = StreamController<DateTime>();
    Timer.periodic(const Duration(milliseconds: 1), (timer) {
      final now = DateTime.now();
      dateStream.add(now);
    });
    return dateStream.stream;
  }
}
