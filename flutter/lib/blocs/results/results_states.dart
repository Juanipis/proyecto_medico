import 'package:equatable/equatable.dart';
import 'package:proyecto_medico/models/result_model.dart';

abstract class ResultsState extends Equatable {}

class ResultsLoadingState extends ResultsState {
  @override
  List<Object?> get props => [];
}

class ResultsLoadedState extends ResultsState {
  ResultsLoadedState(this.result);
  final ResultData result;

  @override
  List<Object?> get props => [result];
}

class ResultsErrorState extends ResultsState {
  ResultsErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
