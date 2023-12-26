import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streage/core/extension/context_extension.dart';

class DefaultButton extends StatelessWidget {
  final AsyncCallback? callback;
  final Text child;
  final Color? color;
  final ValueNotifier<bool> enable;
  const DefaultButton(
      {super.key,
      required this.callback,
      this.color,
      required this.child,
      required this.enable});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: enable,
        builder: (context, _) {
          return InkWell(
              onTap: enable.value ? callback : null,
              enableFeedback: true,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.sp, horizontal: 4.sp),
                decoration: BoxDecoration(
                    color: enable.value
                        ? color ?? context.colors.black
                        : context.colors.gray,
                    borderRadius: BorderRadius.circular(4.sp)),
                child: child,
              ));
        });
  }
}
