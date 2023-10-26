import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:streage/features/age/domain/models/age_model.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/create_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/delete_age_usecase.dart';
import 'package:streage/features/age/domain/usecases/age_usecase/update_age_usecase.dart';
import 'package:streage/features/age/presentation/cubit/age_cubit.dart';
import 'package:streage/features/age/presentation/screens/home_screen.dart';
import 'di_config.dart';

class Root extends StatelessWidget {
  final List<AgeModel?> initialData;
  const Root({super.key, required this.initialData});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AgeCubit>(
        create: (_) => AgeCubit(initialData, locator.get<CreateAgeUsecase>(),
            locator.get<DeleteAgeUsecase>(), locator.get<UpdateAgeUsecase>()),
        child: const MaterialApp(home: HomeScreen()));
  }
}
