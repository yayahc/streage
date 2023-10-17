import 'dart:async';

Stream<DateTime> streamDate() {
  final dateStream = StreamController<DateTime>();
  Timer.periodic(const Duration(milliseconds: 1), (timer) {
    final now = DateTime.now();
    dateStream.add(now);
  });
  return dateStream.stream;
}

Future<void> main() async {
  DateTime birthDate = DateTime(1999, 1, 14, 8, 12, 22);
  await for (final dt in streamDate()) {
    DateTime currentDate = dt;
    Duration difference = currentDate.difference(birthDate);

    int years = difference.inDays ~/ 365;
    int remainingDays = difference.inDays % 365;
    int months = remainingDays ~/ 30;
    remainingDays = remainingDays % 30;
    int days = remainingDays;
    int hours = difference.inHours % 24;
    int minutes = difference.inMinutes % 60;
    int seconds = difference.inSeconds % 60;
    int milliseconds = difference.inMilliseconds % 1000;
    int microseconds = difference.inMicroseconds % 1000;

    print(
        "Years: $years, Months: $months, Days: $days, Hours: $hours, Minutes: $minutes, Seconds: $seconds, Milliseconds: $milliseconds, Microseconds: $microseconds");
  }
}
