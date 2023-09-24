import 'package:equatable/equatable.dart';

abstract class BacteriumEvent extends Equatable {
  const BacteriumEvent();
}

class LoadBacteriumEvent extends BacteriumEvent {
  @override
  List<Object?> get props => [];
}
