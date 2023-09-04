import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_medico/presentation/screens/antibiotic/antibiotic.dart';
import 'package:proyecto_medico/presentation/screens/camara/camara.dart';
import 'package:proyecto_medico/presentation/screens/data_input_mode/camera/camera_input.dart';
import 'package:proyecto_medico/presentation/screens/data_input_mode/data_input_mode.dart';
import 'package:proyecto_medico/presentation/screens/data_input_mode/manual/bacteria_input_list.dart';
import 'package:proyecto_medico/presentation/screens/data_input_mode/manual/manual_input.dart';
import 'package:proyecto_medico/presentation/screens/gram/gram.dart';
import 'package:proyecto_medico/presentation/screens/manual_automatico/manual_automatico.dart';
import 'package:proyecto_medico/presentation/screens/patient_data/patient_data.dart';
import 'package:proyecto_medico/presentation/screens/results/results.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Apptiobiograma',
      theme: ThemeData(useMaterial3: true),
      home: gram_screen(),
      //gram_screen(),
      //TutorialHome(),
      initialRoute: '/',
      routes: {
        '/patient_data': (context) => PatientData(),
        '/antibiotic': (context) => Antibiotic(),
        '/data_input': (context) => DataInputMode(),
        '/data_input/manual': (context) => ManualInput(),
        '/data_input/manual/bacteria': (context) => BacetriaInputList(),
        '/data_input/camera': (context) => CameraInput(),
        '/results': (context) => Results(),
        '/camara': (context) => Camara(),
        '/manual_automatico': (context) => ManualAutomatico(),
        '/gram': (context) => gram_screen(),
      },
    ),
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Apptibiograma',
          textAlign: TextAlign.left,
          style: GoogleFonts.getFont('Outfit'),
        ),
        centerTitle: false,
      ),
      // body is the majority of the screen.
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                child: Image.network(
                  'https://i.postimg.cc/dQX4DSkR/Disen-o-sin-ti-tulo.png',
                  width: 280,
                  height: 280,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Container(
                      width: 300,
                      height: 178,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                  'Antes de continuar por favor lea los términos y condiciones. Si continúa estará aceptando los términos y condiciones',
                                  style: GoogleFonts.readexPro(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  )))))),
            ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 30),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/patient_data');
                    },
                    child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text("Comencemos!",
                            style: GoogleFonts.readexPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ))))),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
