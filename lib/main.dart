import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streage/features/age/presentation/cubit/widget_cubit.dart';
import 'package:streage/features/age/presentation/screens/date_form.dart';
import 'package:streage/features/age/presentation/screens/home_screen.dart';
import 'package:streage/features/age/services/isar/isar_service.dart';
import 'package:streage/root.dart';
import 'di_config.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  final isarService = IsarService();
  configureDependencies(isarService);
  final initD = await getData();

  late final Widget baseScreen;
  if (initD.isEmpty) {
    baseScreen = const AgeForm();
  } else {
    baseScreen = const HomeScreen();
  }

  runApp(Root(
    initialData: initD,
    baseScreen: baseScreen,
  ));
}
