import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_medico/models/data_model.dart';
import 'package:proyecto_medico/presentation/screens/patient_data/form_components.dart';
import 'package:logger/logger.dart';
import 'package:proyecto_medico/presentation/screens/patient_data/body_dialog.dart';
import 'package:proyecto_medico/presentation/text/tittle_material.dart';

class PatientData extends StatelessWidget {
  const PatientData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PatientDataState();
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
  final TextEditingController creatinineClearanceController =
      TextEditingController();
  int selectedInfection = -1;
  bool penicillinAllergy = false;
  bool hemodialysis = false;
  bool capd = false;
  bool crrt = false;
  @override
  void initState() {
    super.initState();
    ageController.addListener(_updateCreatinineClearance);
    weightController.addListener(_updateCreatinineClearance);
    creatinineController.addListener(_updateCreatinineClearance);
  }

  void _updateCreatinineClearance() {
    final age = int.tryParse(ageController.text);
    final weight = int.tryParse(weightController.text);
    final creatinine = double.tryParse(creatinineController.text);

    if (age != null && weight != null && creatinine != null) {
      double creatinineClearance = (140 - age) * weight / (72 * creatinine);
      if (selectedSex == Sex.female) creatinineClearance *= 0.85;
      setState(() {
        creatinineClearanceController.text =
            creatinineClearance.toStringAsFixed(2);
      });
    }
  }

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
    "Sistema central", // 1
    "Sangre", // 2
    "Prostata", // 3
    "Tracto genito urinario", // 4
    "Huesos", // 5
    "Boca", // 6
    "Pulmones y vía aerea", // 7
    "Abdomen", // 8
    "Tejidos blandos", // 9
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
    final List<DropdownMenuEntry<Sex>> sexEntries = <DropdownMenuEntry<Sex>>[];
    for (final Sex sex in Sex.values) {
      sexEntries.add(DropdownMenuEntry(value: sex, label: sex.option));
    }
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
        body: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MaterialText(
                    name: "Ingrese los datos del paciente",
                    style: textTheme.headlineSmall!),
                sexDropDownMenu(sexEntries, width),
                patientTextBoxes(width),
                switches(width),
                infectionLocationButton(width, context, height),
                SizedBox(
                  width: width * 0.9,
                  child: Row(children: [
                    Icon(Icons.medication),
                    Text("Depuración creatinina"),
                    Spacer(),
                    Text(creatinineClearanceController.text),
                    SizedBox(width: 10),
                    Text("mL/min"),
                  ]),
                ),
                continueButton(width, context),
              ],
            ),
          ),
        ));
  }

  SizedBox patientTextBoxes(double width) {
    return SizedBox(
      width: width * 0.9,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              textInput(width, weightController, "Peso (kg)"),
              textInput(width, ageController, "Edad (años)")
            ],
          ),
          textInput(width, creatinineController, "Creatinina (mg/dL)",
              widthScale: 0.90),
        ],
      ),
    );
  }

  SizedBox continueButton(double width, BuildContext context) {
    return SizedBox(
      width: width * 0.9,
      height: 50,
      child: ElevatedButton(
          onPressed: () {
            if (selectedSex == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Seleccione el sexo")));
              return;
            }
            final userDataProvider =
                Provider.of<UserDataProvider>(context, listen: false);
            final userData = UserData(
                sex: (selectedSex!.option == 'Masculino' ? 0 : 1),
                age: ageController.text,
                weight: weightController.text,
                creatinine: creatinineController.text,
                hemodialysis: hemodialysis,
                penicillin: penicillinAllergy,
                crrt: crrt,
                capd: capd,
                infection: selectedInfection + 1,
                creatinineClearance: creatinineClearanceController.text);
            userDataProvider.setUserData(userData);
            logger.d("Sexo: ${selectedSex!.option}"
                "\nPeso: ${weightController.text}"
                "\nEdad: ${ageController.text}"
                "\nCreatinina: ${creatinineController.text}"
                "\nAlergia a penicilina: $penicillinAllergy"
                "\nHemodialisis: $hemodialysis"
                "\nCAPD: $capd"
                "\nCRRT: $crrt"
                "\nInfección: $selectedInfection"
                "\nDepuración de Creatinina: ${creatinineClearanceController.text}");
            Navigator.pushNamed(context, '/data_input');
          },
          child: const Text("Continuar")),
    );
  }

  SizedBox infectionLocationButton(
      double width, BuildContext context, double height) {
    return SizedBox(
      width: width * 0.9,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Ubicación de infección: "),
            Text(selectedInfection < 0 && selectedInfection <= infections.length
                ? "No seleccionada"
                : infections[selectedInfection]),
          ],
        ),
        const Spacer(),
        ElevatedButton(
            onPressed: () async {
              int? selectedInfection =
                  await bodyDialog(context, height, width, infections);
              setState(() {
                this.selectedInfection = selectedInfection!;
              });
            },
            child: const Text("Seleccionar"))
      ]),
    );
  }

  Column switches(double width) {
    return Column(
      children: [
        switchTest(switchsLabels[0], width, 0.9, Icons.medical_services,
            penicillinAllergy, onPenicillinAllergyChanged),
        switchTest(switchsLabels[1], width, 0.9, Icons.medical_services,
            hemodialysis, onHemodialysisChanged),
        switchTest(switchsLabels[2], width, 0.9, Icons.medical_services, capd,
            onCapdChanged),
        switchTest(switchsLabels[3], width, 0.9, Icons.medical_services, crrt,
            onCrrtChanged),
      ],
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
