import 'package:flutter/material.dart';
import 'package:streage/core/ui/theme/color/i_app_color.dart';
import 'package:streage/core/ui/theme/size/i_app_size.dart';
import 'package:streage/di.dart';

extension ContextExtension on BuildContext {
  void showSnackBar(String message) async {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }
}

extension ThemeExtension on BuildContext {
  IAppSize get gaps => locator.get<IAppSize>();

  IAppColor get colors => locator.get<IAppColor>();
}
