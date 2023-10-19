import 'package:isar/isar.dart';
import 'package:streage/features/age/domain/models/entities/age.dart';

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
}
