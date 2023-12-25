import 'package:flutter/material.dart';
import 'package:streage/core/ui/theme/typo/i_app_typography.dart';
import 'package:streage/di.dart';

extension StringExtension on String {
  Text light() {
    return Text(
      this,
      style: locator.get<IAppTypography>().light,
    );
  }

  Text regular() {
    return Text(
      this,
      style: locator.get<IAppTypography>().regular,
    );
  }

  Text medium() {
    return Text(
      this,
      style: locator.get<IAppTypography>().medium,
    );
  }
}
