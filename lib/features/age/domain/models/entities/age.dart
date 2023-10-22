import 'package:isar/isar.dart';

class Age {
  final Id? id;
  final int years;
  final int months;
  final int days;
  final int hours;
  final int minutes;
  final int seconds;
  final int milliseconds;
  final int microseconds;
  Age(
      {required this.id,
      required this.years,
      required this.months,
      required this.days,
      required this.hours,
      required this.minutes,
      required this.seconds,
      required this.milliseconds,
      required this.microseconds});
}
