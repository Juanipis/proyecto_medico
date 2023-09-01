import 'package:flutter/material.dart';
import 'package:proyecto_medico/presentation/screens/data_input_mode/manual/bacteria_input_list.dart';

class ManualInput extends StatelessWidget {
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
          title: Text("Gram"),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/data_input/manual/bacteria');
          },
          child: Text("Continuar"),
        )));
  }
}
