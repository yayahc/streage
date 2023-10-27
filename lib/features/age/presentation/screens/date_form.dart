import 'package:flutter/material.dart';

/// [TODO] get inputs and save them to isar

class AgeForm extends StatefulWidget {
  const AgeForm({super.key});

  @override
  State<AgeForm> createState() => _AgeFormState();
}

class _AgeFormState extends State<AgeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streage'),
        centerTitle: true,
      ),
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
