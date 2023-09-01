import 'package:flutter/material.dart';
import 'package:proyecto_medico/presentation/screens/antibiotic/antibiotic.dart';

class CameraInput extends StatelessWidget {
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
          title: Text("Camara antibioticos"),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/antibiotic');
          },
          child: Text("Continuar"),
        )));
  }
}
