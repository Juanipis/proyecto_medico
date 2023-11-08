import 'package:equatable/equatable.dart';
import 'package:proyecto_medico/models/data_model.dart';

abstract class ResultsEvent extends Equatable {
  const ResultsEvent();
}

class LoadResultsEvent extends ResultsEvent {
  final UserData userData;

  const LoadResultsEvent(this.userData);

  @override
  List<Object?> get props => [userData];
}
