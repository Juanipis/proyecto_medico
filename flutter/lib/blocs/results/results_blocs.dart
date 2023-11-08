import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proyecto_medico/blocs/results/results_events.dart';
import 'package:proyecto_medico/blocs/results/results_states.dart';
import 'package:proyecto_medico/repositories/results_repository.dart';

class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  final ResultsRepository resultsRepository;

  ResultsBloc(this.resultsRepository) : super(ResultsLoadingState()) {
    on<LoadResultsEvent>((event, emit) async {
      emit(ResultsLoadingState());
      try {
        final patientId =
            await resultsRepository.postPatientData(event.userData);
        if (patientId == -1) {
          emit(ResultsErrorState("Error saving patient data"));
        }

        final saveResults =
            await resultsRepository.postResult(event.userData, patientId);
        if (saveResults == -1) {
          emit(ResultsErrorState("Error saving results"));
        }

        final resultsParsed =
            await resultsRepository.getResultByID(saveResults);
        emit(ResultsLoadedState(resultsParsed));
      } catch (e) {
        emit(ResultsErrorState(e.toString()));
      }
    });
  }
}
