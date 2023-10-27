import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:streage/core/extension/context_extension.dart';
import 'package:streage/features/age/presentation/screens/home_screen.dart';

/// [TODO] get inputs and save them to isar

class AgeForm extends StatefulWidget {
  const AgeForm({super.key});

  @override
  State<AgeForm> createState() => _AgeFormState();
}

class _AgeFormState extends State<AgeForm> {
  late DateTime? date;
  late TimeOfDay? time;

  @override
  void initState() {
    super.initState();
    date = null;
    time = null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streage'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final ndate = await _showDatePicker(context);
                  setState(() {
                    date = ndate;
                  });
                },
                child: const Text('Date')),
            ElevatedButton(
                onPressed: () async {
                  final ntime = await _showTimePicker(context);
                  setState(() {
                    time = ntime;
                  });
                },
                child: const Text('Time')),
            ElevatedButton(
                onPressed: () {
                  if (date == null || time == null) {
                    null;
                  } else {
                    _ready(context);
                  }
                },
                child: const Text('Save'))
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

  void _ready(BuildContext context) async {
    final cubit = context.ageCubit();
    final widget = context.widgetCubit();
    await cubit.createAge(date, time);
    widget.changeWidget(const HomeScreen());
  }
}
