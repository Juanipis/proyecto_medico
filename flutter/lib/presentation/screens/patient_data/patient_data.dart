import 'package:flutter/material.dart';

import 'form_components.dart';

class PatientData extends StatefulWidget {
  const PatientData({super.key});

  @override
  State<PatientData> createState() => _PatientDataState();
}

class _PatientDataState extends State<PatientData> {
  final TextEditingController sexController = TextEditingController();
  Sex? selectedSex;

  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController creatinineController = TextEditingController();
  bool penicillinAllergy = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final List<DropdownMenuEntry<Sex>> sexEntries = <DropdownMenuEntry<Sex>>[];
    final formKey = GlobalKey<FormState>();
    for (final Sex sex in Sex.values) {
      sexEntries.add(DropdownMenuEntry(value: sex, label: sex.option));
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text("Datos del paciente"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Ingrese los datos del paciente"),
                  sexDropDownMenu(sexEntries, width),
                  Row(
                    children: [
                      textInput(width, weightController, "Peso (kg)"),
                      separator(width),
                      textInput(width, ageController, "Edad (años)"),
                    ],
                  ),
                  textInput(width, creatinineController, "Creatinina (mg/dL)",
                      widthScale: 0.90),
                  SwitchForm(
                      title: "Alergia a penicilina",
                      width: width,
                      widthScale: 0.9,
                      icon: Icons.medical_services),
                  SwitchForm(
                      title: "Hemodiálisis",
                      width: width,
                      widthScale: 0.9,
                      icon: Icons.medical_services),
                  SwitchForm(
                      title: "CAPD",
                      width: width,
                      widthScale: 0.9,
                      icon: Icons.medical_services),
                  SwitchForm(
                      title: "CRRT",
                      width: width,
                      widthScale: 0.9,
                      icon: Icons.medical_services),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Sexo: ${selectedSex!.option}"
                "\nPeso: ${weightController.text}"
                "\nEdad: ${ageController.text}"
                "\nCreatinina: ${creatinineController.text}"
                "\nSwitch: $penicillinAllergy");
          },
        ));
  }

  //---------------------------------WIDGETS-----------------------------------
  DropdownMenu<Sex> sexDropDownMenu(
      List<DropdownMenuEntry<Sex>> sexEntries, double width) {
    return DropdownMenu(
      controller: sexController,
      dropdownMenuEntries: sexEntries,
      label: const Text("Sexo"),
      onSelected: (Sex? sexChosen) {
        setState(() {
          selectedSex = sexChosen;
        });
      },
      width: width * 0.9,
    );
  }

  SizedBox separator(double width) {
    return SizedBox(
      height: 50,
      width: width * 0.1,
    );
  }

  SizedBox textInput(
      double width, TextEditingController boxController, String labelField,
      {double widthScale = 0.40}) {
    return SizedBox(
      height: 50,
      width: width * widthScale,
      child: TextFormField(
        controller: boxController,
        decoration: InputDecoration(
          labelText: labelField,
        ),
      ),
    );
  }
}

enum Sex {
  male('Masculino'),
  female('Femenino');

  const Sex(this.option);
  final String option;
}
