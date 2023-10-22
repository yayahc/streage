import 'package:isar/isar.dart';
import 'package:streage/features/age/domain/models/entities/age.dart';
import 'package:streage/features/age/domain/usecases/params/create_age_param.dart';
import 'package:streage/features/age/domain/usecases/params/update_age_param.dart';

part 'age_model.g.dart';

@collection
class AgeModel extends Age {
  Id id = Isar.autoIncrement;

  AgeModel(
      {required super.years,
      required super.months,
      required super.days,
      required super.hours,
      required super.minutes,
      required super.seconds,
      required super.milliseconds,
      required super.microseconds});

  // Create Age
  factory AgeModel.fromCreateAgeParam({required CreateAgeParam param}) {
    return AgeModel(
        years: param.years,
        months: param.months,
        days: param.days,
        hours: param.hours,
        minutes: param.minutes,
        seconds: param.seconds,
        milliseconds: param.milliseconds,
        microseconds: param.microseconds);
  }

  // Create Age
  factory AgeModel.fromUpdateAgeParam({required UpdateAgeParam param}) {
    return AgeModel(
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
