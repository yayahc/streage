import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streage/features/age/domain/models/age_model.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/create_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/delete_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/update_age_usecase.dart';
import 'package:streage/features/age/presentation/cubit/age_cubit.dart';
import 'package:streage/features/age/presentation/cubit/widget_cubit.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: _getProviders(context),
        child: MaterialApp(
            home: BlocBuilder<WidgetCubit, Widget>(
                builder: (_, state) => state)));
  }

  List<BlocProvider> _getProviders(BuildContext context) {
    return [];
  }
}
