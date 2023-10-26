import 'package:isar/isar.dart';

class Age {
  final Id? id;
  late final int years;
  late final int months;
  late final int days;
  late final int hours;
  late final int minutes;
  late final int seconds;
  late final int milliseconds;
  late final int microseconds;
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
