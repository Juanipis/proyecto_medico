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
            elevation: 0, // No shadow
            color: Theme.of(context)
                .colorScheme
                .surfaceVariant, // Background color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0), // Rounded corners
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Inner padding
              child: Column(
                mainAxisSize: MainAxisSize.min, // Fit content size
                children: <Widget>[
                  ListTile(
                    title:
                        Text('ID: ${result.id}', style: textTheme.titleLarge),
                  ),
                  ListTile(
                    title: Text('Bacterium: ${result.bacterium.name}',
                        style: textTheme.titleMedium),
                  ),
                  ListTile(
                    title: Text('Patient ID: ${result.patient.id}',
                        style: textTheme.titleMedium),
                  ),
                  ListTile(
                    title: Text('Result: ${result.result}',
                        style: textTheme.titleMedium),
                  ),
                  ExpansionTile(
                    title:
                        Text('Antibiotics Info', style: textTheme.titleLarge),
                    children: result.antibioticsInfoJson.entries.map((entry) {
                      return ListTile(
                        title: Text('ID: ${entry.key}',
                            style: textTheme.bodyLarge),
                        subtitle: Text(
                          'Name: ${entry.value.name}, Quantity: ${entry.value.quantity}, Operator: ${entry.value.operator}',
                          style: textTheme.bodyMedium,
                        ),
                      );
                    }).toList(),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: const Text("Continue"),
                  )
                ],
              ),
            ),
          );
        } else if (state is ResultsErrorState) {
          return Center(
            child: Text(state.error, style: textTheme.titleMedium),
          );
        } else {
          return const Center(
            child: Text("Unexpected Error"),
          );
        }
      },
    );
  }
}
