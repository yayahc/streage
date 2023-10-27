import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetCubit extends Cubit<Widget> {
  WidgetCubit(super.initialState);

  void changeWidget(Widget widget) {
    emit(widget);
  }
}
