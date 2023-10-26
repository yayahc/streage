import 'dart:async';
import 'package:flutter/material.dart';
import 'package:streage/features/age/services/isar/isar_service.dart';
import 'package:streage/root.dart';
import 'di_config.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  final isarService = IsarService();
  configureDependencies(isarService);
  final initD = await getData();

  runApp(Root(
    initialData: initD,
  ));
}
