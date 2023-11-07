import 'package:equatable/equatable.dart';
import 'package:proyecto_medico/models/bacterium_model.dart';

abstract class BacteriumState extends Equatable {}

class BacteriumLoadingState extends BacteriumState {
  @override
  List<Object?> get props => [];
}

class BacteriumLoadedState extends BacteriumState {
  BacteriumLoadedState(this.bacteriums);
  final List<BacteriumModel> bacteriums;

  @override
  List<Object?> get props => [bacteriums];
}

class BacteriumErrorState extends BacteriumState {
  BacteriumErrorState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
