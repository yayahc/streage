import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streage/core/extension/context_extension.dart';
import 'package:streage/di.dart';
import 'package:streage/features/age/domain/models/age_model.dart';
import 'package:streage/features/age/domain/models/entities/age.dart';
import 'package:streage/features/age/presentation/cubit/age_cubit.dart';
import 'package:streage/features/age/presentation/cubit/age_state.dart';
import 'package:streage/features/age/presentation/cubit/widget_cubit.dart';
import 'package:streage/features/age/presentation/screens/date_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AgeCubit, AgeState>(builder: (context, state) {
        if (state is AgeInitial || state is AgeIsProcessing) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AgeFailed) {
          return const Center(
            child: Text("Echec de lecture de l'age"),
          );
        } else if (state is AgeIsDone) {
          return _ageBuilder(context, state.ages.first!);
        }
        return const SizedBox();
      }),
    );
  }

  void _deleteAge(BuildContext context, AgeModel age) async {
    final cubit = locator.get<AgeCubit>();
    final widget = BlocProvider.of<WidgetCubit>(context);
    await cubit.deleteAge(age.id!);
    widget.changeWidget(const AgeForm());
  }

  Stream<List<int>> ageStream(AgeModel age) {
    late StreamController<List<int>> dateStream = StreamController<List<int>>();
    DateTime birthDate = DateTime(age.years, age.months, age.days);

    Timer.periodic(const Duration(microseconds: 1), (timer) {
      final now = DateTime.now();

      // Calculate years
      int year = now.year - birthDate.year;
      if (now.month < birthDate.month ||
          (now.month == birthDate.month && now.day < birthDate.day)) {
        year--;
      }

      // Calculate days
      int day = (now.day - birthDate.day).abs();

      // Calculate months
      int month;
      switch (now.month - birthDate.month) {
        case int n when n > 0:
          month = now.month - birthDate.month;
          break;
        case int n when n < 0:
          month = now.month - birthDate.month + 12;
          break;
        default:
          if (day < 0) {
            final daysInLastMonth = DateTime(now.year, now.month, 0).day;
            month = 11;
            day = daysInLastMonth + day;
          } else {
            month = 0;
          }
      }

      // Calculate time
      int hour = now.hour - birthDate.hour;
      int minute = now.minute - birthDate.minute;
      int second = now.second - birthDate.second;
      int millisecond = now.millisecond - birthDate.millisecond;
      int microsecond = now.microsecond - birthDate.microsecond;

      dateStream.add(
          [year, month, day, hour, minute, second, millisecond, microsecond]);
    });

    return dateStream.stream;
  }

  Widget _ageBuilder(BuildContext context, AgeModel age) {
    return StreamBuilder<List<int>>(
      initialData: const <int>[],
      stream: ageStream(age),
      builder: (context, snapshot) {
        final data = snapshot.data!;
        return data.isEmpty
            ? const CircularProgressIndicator()
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${data[0]} ans'),
                    Text('${data[1]} mois'),
                    Text('${data[2]} jours'),
                    Text('${data[3]} heures'),
                    Text('${data[4]} minutes'),
                    Text('${data[5]} secondes'),
                    Text('${data[6]} millisecondes'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                        onPressed: () => _deleteAge(context, age),
                        child: const Text('Delete'))
                  ],
                ),
              );
      },
    );
  }
}
