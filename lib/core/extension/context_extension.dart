import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void showSnackBar(String message) async {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }
}
