import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_medico/blocs/bacterium/bacterium_events.dart';
import 'package:proyecto_medico/blocs/bacterium/bacterium_states.dart';

import 'package:proyecto_medico/repositories/bacterium_repository.dart';

class BacteriumBloc extends Bloc<BacteriumEvent, BacteriumState> {
  final BacteriumRepository bacteriumRepository;

  BacteriumBloc(this.bacteriumRepository) : super(BacteriumLoadingState()) {
    on<LoadBacteriumEvent>((event, emit) async {
      emit(BacteriumLoadingState());
      try {
        final bacteriums = await bacteriumRepository.getBacteriums();
        emit(BacteriumLoadedState(bacteriums));
      } catch (e) {
        emit(BacteriumErrorState(e.toString()));
      }
    });
  }
}
