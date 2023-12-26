import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streage/core/extension/context_extension.dart';

class DefaultIconButton extends StatelessWidget {
  final AsyncCallback? callback;
  final IconData icon;
  final Color? color;
  const DefaultIconButton(
      {super.key, required this.callback, required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: callback,
        enableFeedback: true,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 4.sp),
          decoration: BoxDecoration(
              color: color ?? context.colors.black,
              borderRadius: BorderRadius.circular(4.sp)),
          child: Icon(icon, color: context.colors.white),
        ));
  }
}
