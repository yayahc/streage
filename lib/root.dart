import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streage/core/extension/context_extension.dart';
import 'package:streage/features/age/domain/models/age_model.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/create_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/delete_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/update_age_usecase.dart';
import 'package:streage/features/age/presentation/cubit/age_cubit.dart';
import 'package:streage/features/age/presentation/cubit/widget_cubit.dart';
import 'package:streage/features/age/presentation/screens/home_screen.dart';
import 'di_config.dart';

class Root extends StatelessWidget {
  final Widget baseScreen;
  final List<AgeModel?> initialData;
  const Root({super.key, required this.initialData, required this.baseScreen});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: _getProviders(context),
        child: MaterialApp(
            home: BlocBuilder<WidgetCubit, Widget>(
                builder: (context, state) => state)));
  }

  List<BlocProvider> _getProviders(BuildContext context) {
    final ageCubit = AgeCubit(initialData, locator.get<CreateAgeUsecase>(),
        locator.get<DeleteAgeUsecase>(), locator.get<UpdateAgeUsecase>());
    final widgetCubit = WidgetCubit(baseScreen);
    return [
      BlocProvider<AgeCubit>(create: (context) => ageCubit),
      BlocProvider<WidgetCubit>(create: (context) => widgetCubit)
    ];
  }
}
