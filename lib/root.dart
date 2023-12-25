import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streage/di.dart';
import 'package:streage/features/age/domain/models/age_model.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/create_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/delete_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/update_age_usecase.dart';
import 'package:streage/features/age/presentation/cubit/age_cubit.dart';
import 'package:streage/features/age/presentation/screens/home_screen.dart';
import 'package:streage/router.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: _getProviders(context),
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
        ));
  }

  List<BlocProvider> _getProviders(BuildContext context) {
    return [
      BlocProvider<AgeCubit>(
        create: (context) => locator.get<AgeCubit>(),
      )
    ];
  }
}
