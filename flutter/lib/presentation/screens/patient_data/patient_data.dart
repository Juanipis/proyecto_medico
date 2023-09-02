import 'package:flutter/material.dart';

class PatientData extends StatefulWidget {
  const PatientData({super.key});

  @override
  State<PatientData> createState() => _PatientDataState();
}

class _PatientDataState extends State<PatientData> {
  final TextEditingController sexController = TextEditingController();
  Sex? selectedSex;

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
                      SizedBox(
                        height: 50,
                        width: width * 0.40,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Peso (kg)",
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: width * 0.1,
                      ),
                      SizedBox(
                        height: 50,
                        width: width * 0.40,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Edad (años)",
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
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
}

enum Sex {
  male('Masculino'),
  female('Femenino');

  const Sex(this.option);
  final String option;
}
