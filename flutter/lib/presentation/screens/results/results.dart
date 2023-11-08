import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_medico/models/data_model.dart';
import 'package:proyecto_medico/presentation/text/tittle_material.dart';
import 'package:logger/logger.dart';

final infections = [
  "Sistema central", // 0
  "Sangre", // 1
  "Prostata", // 2
  "Tracto genito urinario", // 3
  "Huesos", // 4
  "Boca", // 5
  "Pulmones y vía aerea", // 6
  "Abdomen", // 7
  "Tejidos blandos", // 8
];

class Results extends StatelessWidget {
  const Results({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final userDataProvider = Provider.of<UserDataProvider>(context);
    final userData = userDataProvider.userData;
    var logger = Logger();
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Scaffold(
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
          child: Column(
            children: [
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 5, 0, 0),
                            child: MaterialText(
                                name: 'Resultados del análisis',
                                style: textTheme.titleLarge!)),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                          child: MaterialText(
                              name: 'Bacteria: ${userData?.bacterium}',
                              style: textTheme.labelLarge!),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                          child: MaterialText(
                              name:
                                  'Organo: ${infections[userData?.infection ?? 0]}',
                              style: textTheme.labelLarge!),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                50, 5, 0, 0),
                            child: MaterialText(
                                name:
                                    "Sexo: ${userData?.sex}\nPeso: ${userData?.weight}\nEdad: ${userData?.age}\nCreatinina: ${userData?.creatinine}\nAlergia a penicilina: ${userData?.penicillin}\nHemodialisis: ${userData?.hemodialysis}\nCAPD: ${userData?.capd}\nCRRT: ${userData?.crrt}\nDepuración de Creatinina: ${userData?.creatinineClearance}",
                                style: textTheme.labelLarge!)),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(-1, 0),
                        child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                10, 5, 0, 0),
                            child: MaterialText(
                                name: 'Resultados del tratamiento:',
                                style: textTheme.labelLarge!)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              // Verifica que haya datos de antibióticos para mostrar
              if (userData?.antibiotics != null &&
                  userData!.antibiotics!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Datos de los antibióticos:',
                          style: textTheme.titleLarge),
                      ...userData.antibiotics!.entries.map(
                        (entry) {
                          final antibioticName = entry.key;
                          final antibioticData = entry.value;
                          return Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              '$antibioticName: Cantidad - ${antibioticData["quantity"]}, Operador - ${antibioticData["operator"]}',
                              style: textTheme.bodyLarge,
                            ),
                          );
                        },
                      ).toList(),
                    ],
                  ),
                ),

              ElevatedButton(
                onPressed: () {
                  logger.d("Sexo: ${userData?.sex}"
                      "\nPeso: ${userData?.weight}"
                      "\nEdad: ${userData?.age}'"
                      "\nCreatinina: ${userData?.creatinine}"
                      "\nAlergia a penicilina: ${userData?.penicillin}"
                      "\nHemodialisis: ${userData?.hemodialysis}"
                      "\nCAPD: ${userData?.capd}"
                      "\nCRRT: ${userData?.crrt}"
                      "\nInfección: ${userData?.infection}"
                      "\nBacteria: ${userData?.bacterium}"
                      "\nDepuración de Creatinina: ${userData?.creatinineClearance}");
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: const Text("Continuar"),
              ),
            ],
          ),
        )));
  }
}
