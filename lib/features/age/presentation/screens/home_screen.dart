import 'package:flutter/material.dart';
import 'package:streage/core/extension/context_extension.dart';
import 'package:streage/features/age/presentation/cubit/age_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<int>>(
        initialData: const <int>[],
        stream: context.ageCubit().ageStream(),
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
                    ],
                  ),
                );
        },
      ),
    );
  }
}
