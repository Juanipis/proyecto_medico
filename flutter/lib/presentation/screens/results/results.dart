import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_medico/blocs/results/results_blocs.dart';
import 'package:proyecto_medico/blocs/results/results_events.dart';
import 'package:proyecto_medico/blocs/results/results_states.dart';
import 'package:proyecto_medico/models/data_model.dart';
import 'package:proyecto_medico/presentation/text/tittle_material.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_medico/repositories/results_repository.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);
    final userData = userDataProvider.userData;
    var logger = Logger();
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return BlocProvider(
        create: (context) =>
            ResultsBloc(ResultsRepository())..add(LoadResultsEvent(userData!)),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: const Text("Resultados"),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: buildResults(textTheme, userData, logger, context),
            ),
          ),
        ));
  }

  BlocBuilder<ResultsBloc, ResultsState> buildResults(TextTheme textTheme,
      UserData? userData, Logger logger, BuildContext context) {
    return BlocBuilder<ResultsBloc, ResultsState>(
      builder: (context, state) {
        if (state is ResultsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ResultsLoadedState) {
          final result = state.result;
          return Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('ID: ${result.id}'),
                ),
                ListTile(
                  title: Text('Bacterium: ${result.bacterium.name}'),
                ),
                ListTile(
                  title: Text('Patient ID: ${result.patient.id}'),
                ),
                ListTile(
                  title: Text('Result: ${result.result}'),
                ),
                ExpansionTile(
                  title: Text('Antibiotics Info'),
                  children: result.antibioticsInfoJson.entries.map((entry) {
                    return ListTile(
                      title: Text('ID: ${entry.key}'),
                      subtitle: Text(
                          'Quantity: ${entry.value.quantity}, Operator: ${entry.value.operator}'),
                    );
                  }).toList(),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: Text("Continuar"))
              ],
            ),
          );
        } else if (state is ResultsErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }
}
