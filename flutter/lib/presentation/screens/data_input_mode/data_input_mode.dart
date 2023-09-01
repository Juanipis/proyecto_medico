import 'package:flutter/material.dart';
import 'package:proyecto_medico/presentation/screens/data_input_mode/camera/camera_input.dart';
import 'package:proyecto_medico/presentation/screens/data_input_mode/manual/manual_input.dart';

class DataInputMode extends StatelessWidget {
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
            title: Text("Modo de entrada")),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/data_input/manual');
                },
                child: Text("Entrada manual"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/data_input/camera');
                },
                child: Text("Entrada automática"),
              ),
            ],
          ),
        ));
  }
}
