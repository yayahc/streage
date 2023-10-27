import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streage/features/age/presentation/cubit/age_cubit.dart';
import 'package:streage/features/age/presentation/cubit/widget_cubit.dart';

extension ContextExtension on BuildContext {
  AgeCubit ageCubit() {
    return BlocProvider.of<AgeCubit>(this);
  }

  WidgetCubit widgetCubit() {
    return BlocProvider.of<WidgetCubit>(this);
  }
}
