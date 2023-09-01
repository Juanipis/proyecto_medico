import 'package:flutter/material.dart';
import 'package:proyecto_medico/presentation/screens/results/results.dart';

class Antibiotic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Antibioticos"),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/results');
          },
          child: Text("Continuar"),
        )));
  }
}
