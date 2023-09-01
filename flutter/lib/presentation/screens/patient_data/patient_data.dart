import 'package:flutter/material.dart';

import '../data_input_mode/data_input_mode.dart';

class PatientData extends StatelessWidget {
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
          title: Text("General"),
        ),
        body: Center(
            child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/data_input');
          },
          child: Text("Continuar"),
        )));
  }
}
