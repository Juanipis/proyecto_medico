import 'package:flutter/material.dart';
import 'package:proyecto_medico/preference/prefs.dart';
import 'package:proyecto_medico/preference/preferences_utils.dart';
import 'package:proyecto_medico/presentation/text/tittle_material.dart';

class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
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
                          padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                          child: MaterialText(
                              name: 'Resultados del análisis',
                              style: textTheme.titleLarge!)),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                        child: MaterialText(
                            name: 'Bacteria: blbabalbalba',
                            style: textTheme.labelLarge!),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                        child: MaterialText(
                            name: 'Organo: Corazón',
                            style: textTheme.labelLarge!),
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(50, 5, 0, 0),
                          child: MaterialText(
                              name: '- Germen blabla\n- Germen blabla 2',
                              style: textTheme.labelLarge!)),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                          child: MaterialText(
                              name: 'Resultados del tratamiento:',
                              style: textTheme.labelLarge!)),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 2, 0, 0),
                          child: MaterialText(
                              name:
                                  'Opción 1: Lorem ipsum dolor\n2 gml sav chora',
                              style: textTheme.labelLarge!)),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 2, 0, 0),
                          child: MaterialText(
                              name:
                                  'Opción 2: Lorem ipsum dolor\n2 gml sav chora',
                              style: textTheme.labelLarge!)),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 2, 0, 0),
                          child: MaterialText(
                              name:
                                  'Opción 2: Lorem ipsum dolor\n2 gml sav chora',
                              style: textTheme.labelLarge!)),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(-1, 0),
                      child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(10, 2, 0, 0),
                          child: MaterialText(
                              name:
                                  'Opción 2: Lorem ipsum dolor\n2 gml sav chora',
                              style: textTheme.labelLarge!)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: const Text("Continuar"),
            ),
          ],
        )));
  }
}
