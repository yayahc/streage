import 'dart:async';
import 'package:flutter/material.dart';
import 'package:streage/features/age/presentation/screens/date_form.dart';
import 'package:streage/features/age/presentation/screens/home_screen.dart';
import 'package:streage/core/services/isar/isar_service.dart';
import 'package:streage/root.dart';
import 'di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const Root());
}
