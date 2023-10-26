import 'package:flutter/material.dart';
import 'package:streage/di.dart';
import 'package:streage/features/age/services/isar/isar_service.dart';
import 'package:streage/root.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  final isarService = IsarService();
  await injectDependencies(isarService);

  runApp(const Root());
}
