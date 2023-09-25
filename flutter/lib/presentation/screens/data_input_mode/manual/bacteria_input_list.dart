import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_medico/blocs/bacterium/bacterium_blocs.dart';
import 'package:proyecto_medico/blocs/bacterium/bacterium_events.dart';
import 'package:proyecto_medico/blocs/bacterium/bacterium_states.dart';
import 'package:proyecto_medico/models/bacterium_model.dart';
import 'package:proyecto_medico/presentation/text/tittle_material.dart';
import 'package:proyecto_medico/repositories/bacterium_repository.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_medico/models/data_model.dart';

class BacteriaScreen extends StatefulWidget {
  const BacteriaScreen({super.key});

  @override
  _BacteriaScreenState createState() => _BacteriaScreenState();
}

class _BacteriaScreenState extends State<BacteriaScreen> {
  int? selectedBacteriumIndex;
  String? selectedBacteriumName;
  var logger = Logger();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    return BlocProvider(
      create: (context) =>
          BacteriumBloc(BacteriumRepository())..add(LoadBacteriumEvent()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("Bacterias"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaterialText(
                  name: 'Listado de bacterias',
                  style: textTheme.headlineSmall!),
              bacteriumRadioBuilder(),
              SizedBox(
                width: width,
                child: ElevatedButton(
                    onPressed: () {
                      if (selectedBacteriumIndex == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text("Por favor seleccione una bacteria")));
                        return;
                      }
                      logger.i(
                          "Bacteria selected: $selectedBacteriumName : $selectedBacteriumIndex");
                      final userDataProvider = Provider.of<UserDataProvider>(context, listen: false);
                      final userData = userDataProvider.userData;
                      userData!.setBacterium(selectedBacteriumIndex!);
                      userDataProvider.setUserData(userData);
                      Navigator.pushNamed(context, '/antibiotic');
                    },
                    child: const Text("Siguiente")),
              )
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<BacteriumBloc, BacteriumState> bacteriumRadioBuilder() {
    return BlocBuilder<BacteriumBloc, BacteriumState>(
      builder: (context, state) {
        if (state is BacteriumLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is BacteriumLoadedState) {
          List<BacteriumModel> bacteriumList = state.bacteriums;
          return Expanded(
            child: ListView.builder(
                itemCount: bacteriumList.length,
                itemBuilder: (context, index) {
                  return RadioListTile<int>(
                    value: index,
                    groupValue: selectedBacteriumIndex,
                    onChanged: (value) {
                      setState(() {
                        selectedBacteriumIndex = value;
                        selectedBacteriumName = bacteriumList[index].name;
                      });
                    },
                    title: Text(bacteriumList[index].name),
                  );
                }),
          );
        }

        if (state is BacteriumErrorState) {
          return Center(
            child: Text(state.error),
          );
        }
        return Container();
      },
    );
  }
}
