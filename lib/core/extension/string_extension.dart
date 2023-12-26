import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:streage/core/extension/context_extension.dart';
import 'package:streage/core/ui/theme/typo/i_app_typography.dart';
import 'package:streage/core/ui/widgets/buttons/default_app_button.dart';
import 'package:streage/di.dart';
import 'package:streage/router.dart';

extension StringExtension on String {
  Text light({Color? color}) {
    return Text(
      this,
      style: locator
          .get<IAppTypography>()
          .light
          .copyWith(color: color ?? navKey.currentContext?.colors.black),
    );
  }

  Text regular({Color? color}) {
    return Text(
      this,
      style: locator
          .get<IAppTypography>()
          .regular
          .copyWith(color: color ?? navKey.currentContext?.colors.black),
    );
  }

  Text medium({Color? color}) {
    return Text(
      this,
      style: locator
          .get<IAppTypography>()
          .medium
          .copyWith(color: color ?? navKey.currentContext?.colors.black),
    );
  }
}

extension TextAsButtonExtension on Text {
  Widget asPrimaryTextButton(
      {AsyncCallback? callback, ValueNotifier<bool>? enable}) {
    return DefaultButton(callback: callback, enable: enable!, child: this);
  }
}
