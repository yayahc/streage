import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:streage/features/age/presentation/cubit/age_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime? date;
  late TimeOfDay? time;
  late int year;
  late int month;
  late int day;
  late int hour;
  late int minute;
  late int second;
  late int millisecond;
  late int microsecond;

  @override
  void initState() {
    super.initState();
    time = TimeOfDay.now();
    date = DateTime.now();
    year = 0;
    month = 0;
    day = 0;
    hour = 0;
    minute = 0;
    second = 0;
    millisecond = 0;
    microsecond = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    showStreaAge();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('$year ans  '),
                Text('$month mois  '),
                Text('$day jours  '),
                Text('$hour H  '),
                Text('$minute min  '),
                Text('$second s  '),
                Text('$millisecond  mls  '),
                Text('$microsecond mcs  '),
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  date = await _showDatePicker(context);
                  setState(() {});
                },
                child: const Text('Date')),
            ElevatedButton(
                onPressed: () async {
                  time = await _showTimePicker(context);
                  setState(() {});
                },
                child: const Text('Time')),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> _showDatePicker(BuildContext context) async {
    DateTime? newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 10),
      borderRadius: 16,
    );
    return newDateTime;
  }

  Future<TimeOfDay?> _showTimePicker(BuildContext context) async {
    final timePicked = await showRoundedTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    return timePicked;
  }

  Future<void> showStreaAge() async {
    final streamAge = BlocProvider.of<AgeCubit>(context).streamDate();
    DateTime birthDate = DateTime(
        date!.year, date!.month, date!.day, time!.hour, time!.minute, 00);
    await for (final dt in streamAge) {
      DateTime currentDate = dt;
      Duration difference = currentDate.difference(birthDate);

      year = difference.inDays ~/ 365;
      int remainingDays = difference.inDays % 365;
      month = remainingDays ~/ 30;
      remainingDays = remainingDays % 30;
      day = remainingDays;
      hour = difference.inHours % 24;
      minute = difference.inMinutes % 60;
      second = difference.inSeconds % 60;
      millisecond = difference.inMilliseconds % 1000;
      microsecond = difference.inMicroseconds % 1000;
      setState(() {});
    }
  }
}
