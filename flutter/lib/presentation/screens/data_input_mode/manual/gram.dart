import 'package:flutter/material.dart';
import 'package:proyecto_medico/presentation/text/tittle_material.dart';

class GramScreen extends StatelessWidget {
  const GramScreen({super.key});

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
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text("Datos del paciente"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialText(
                name: 'Listado de bacterias', style: textTheme.headlineSmall!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 300,
                            height: 100,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.orange)),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/data_input/manual/bacteria');
                                },
                                child: const Text(
                                  "Gram +",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ))),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                            width: 300,
                            height: 100,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/bacteria');
                                },
                                child: const Text(
                                  "Gram -",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ))),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
