import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streage/di.dart';
import 'package:streage/features/age/presentation/cubit/age_cubit.dart';
import 'package:streage/router.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
          providers: _getProviders(context),
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
          )),
    );
  }

  List<BlocProvider> _getProviders(BuildContext context) {
    return [
      BlocProvider<AgeCubit>(
        create: (context) => locator.get<AgeCubit>(),
      )
    ];
  }
}
