import 'package:equatable/equatable.dart';
import 'package:streage/features/age/domain/models/age_model.dart';

abstract class AgeState extends Equatable {}

class AgeInitial extends AgeState {
  @override
  List<Object?> get props => [];
}

class AgeIsProcessing extends AgeState {
  @override
  List<Object?> get props => [];
}

class AgeFailed extends AgeState {
  @override
  List<Object?> get props => [];
}

class AgeIsDone extends AgeState {
  final List<AgeModel?> ages;
  AgeIsDone(this.ages);

  @override
  List<Object?> get props => [ages];
}
