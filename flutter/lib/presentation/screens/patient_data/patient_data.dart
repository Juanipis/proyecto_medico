import 'package:flutter/material.dart';
import 'package:proyecto_medico/presentation/screens/patient_data/form_components.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_medico/presentation/screens/patient_data/body_dialog.dart';

class PatientData extends StatelessWidget {
  const PatientData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PatientDataState();
  }
}

class PatientDataState extends StatefulWidget {
  const PatientDataState({super.key});

  @override
  State<PatientDataState> createState() => _FormTestState();
}

class _FormTestState extends State<PatientDataState> {
  final TextEditingController sexController = TextEditingController();
  Sex? selectedSex;
  var logger = Logger();

  final TextEditingController weightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController creatinineController = TextEditingController();
  int selectedInfection = -1;
  bool penicillinAllergy = false;
  bool hemodialysis = false;
  bool capd = false;
  bool crrt = false;
  onPenicillinAllergyChanged(bool value) {
    setState(() {
      penicillinAllergy = value;
    });
  }

  onHemodialysisChanged(bool value) {
    setState(() {
      hemodialysis = value;
    });
  }

  onCapdChanged(bool value) {
    setState(() {
      capd = value;
    });
  }

  onCrrtChanged(bool value) {
    setState(() {
      crrt = value;
    });
  }

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

  final switchsLabels = [
    "Alergia a penicilina",
    "Hemodialisis",
    "CAPD",
    "CRRT",
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final formKey = GlobalKey<FormState>();
    final List<DropdownMenuEntry<Sex>> sexEntries = <DropdownMenuEntry<Sex>>[];
    for (final Sex sex in Sex.values) {
      sexEntries.add(DropdownMenuEntry(value: sex, label: sex.option));
    }

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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Ingrese los datos del paciente"),
              sexDropDownMenu(sexEntries, width),
              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          textInput(width, weightController, "Peso (kg)"),
                          separator(width),
                          textInput(width, ageController, "Edad (años)")
                        ],
                      ),
                      textInput(
                          width, creatinineController, "Creatinina (mg/dL)",
                          widthScale: 0.90),
                    ],
                  )),
              Column(
                children: [
                  switchTest(
                      switchsLabels[0],
                      width,
                      0.9,
                      Icons.medical_services,
                      penicillinAllergy,
                      onPenicillinAllergyChanged),
                  switchTest(
                      switchsLabels[1],
                      width,
                      0.9,
                      Icons.medical_services,
                      hemodialysis,
                      onHemodialysisChanged),
                  switchTest(switchsLabels[2], width, 0.9,
                      Icons.medical_services, capd, onCapdChanged),
                  switchTest(switchsLabels[3], width, 0.9,
                      Icons.medical_services, crrt, onCrrtChanged),
                  SizedBox(
                    width: width * 0.9,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Ubicación de infección: "),
                              Text(selectedInfection < 0 &&
                                      selectedInfection <= infections.length
                                  ? "No seleccionada"
                                  : infections[selectedInfection]),
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                              onPressed: () async {
                                int? selectedInfection = await bodyDialog(
                                    context, height, width, infections);
                                setState(() {
                                  this.selectedInfection = selectedInfection!;
                                });
                              },
                              child: const Text("Seleccionar"))
                        ]),
                  ),
                  SizedBox(
                    width: width * 0.9,
                    child: const Row(children: [
                      Icon(Icons.medication),
                      Text("Depuración creatinina"),
                      Spacer(),
                      Text("151"),
                      SizedBox(width: 10),
                      Text("mg/dL"),
                    ]),
                  ),
                  SizedBox(
                    width: width * 0.9,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          if (selectedSex == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Seleccione el sexo")));
                            return;
                          }
                          logger.d("Sexo: ${selectedSex!.option}"
                              "\nPeso: ${weightController.text}"
                              "\nEdad: ${ageController.text}"
                              "\nCreatinina: ${creatinineController.text}"
                              "\nAlergia a penicilina: $penicillinAllergy"
                              "\nHemodialisis: $hemodialysis"
                              "\nCAPD: $capd"
                              "\nCRRT: $crrt"
                              "\nInfección: $selectedInfection");
                        },
                        child: const Text("Continuar")),
                  ),
                  SizedBox(
                    width: width * 0.9,
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

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

  SizedBox separator(double width) {
    return SizedBox(
      height: 50,
      width: width * 0.1,
    );
  }
}

enum Sex {
  male('Masculino'),
  female('Femenino');

  const Sex(this.option);
  final String option;
}
