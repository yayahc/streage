import 'package:isar/isar.dart';
import 'package:streage/features/age/domain/models/entities/age.dart';
import 'package:streage/features/age/domain/usecases/params/create_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/update_age_param.dart';

part 'age_model.g.dart';

@collection
class AgeModel extends Age {
  AgeModel(
      {required super.id,
      required super.years,
      required super.months,
      required super.days,
      required super.hours,
      required super.minutes,
      required super.seconds,
      required super.milliseconds,
      required super.microseconds});

  // Create Age
  factory AgeModel.createAge({
    required id,
    required years,
    required months,
    required days,
    required hours,
    required minutes,
    required seconds,
    required milliseconds,
    required microseconds,
  }) {
    return AgeModel(
        id: id,
        years: years,
        months: months,
        days: days,
        hours: hours,
        minutes: minutes,
        seconds: seconds,
        milliseconds: milliseconds,
        microseconds: microseconds);
  }

  // Create Age from param
  factory AgeModel.fromCreateAgeParam({required CreateAgeParam param}) {
    return AgeModel(
        id: null,
        years: param.years,
        months: param.months,
        days: param.days,
        hours: param.hours,
        minutes: param.minutes,
        seconds: param.seconds,
        milliseconds: param.milliseconds,
        microseconds: param.microseconds);
  }

  // Create Age from param
  factory AgeModel.fromUpdateAgeParam({required UpdateAgeParam param}) {
    return AgeModel(
        id: param.id,
        years: param.years,
        months: param.months,
        days: param.days,
        hours: param.hours,
        minutes: param.minutes,
        seconds: param.seconds,
        milliseconds: param.milliseconds,
        microseconds: param.microseconds);
  }
}
