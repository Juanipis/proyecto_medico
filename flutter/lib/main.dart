import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proyecto_medico/presentation/screens/antibiotic/antibiotic.dart';
import 'package:proyecto_medico/presentation/screens/data_input_mode/camera/camera_input.dart';
import 'package:proyecto_medico/presentation/screens/data_input_mode/manual/bacteria_input_list.dart';
import 'package:proyecto_medico/presentation/screens/data_input_mode/manual/gram.dart';
import 'package:proyecto_medico/presentation/screens/manual_automatico/manual_automatico.dart';
import 'package:proyecto_medico/presentation/screens/patient_data/patient_data.dart';
import 'package:proyecto_medico/presentation/screens/results/results.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Apptiobiograma',
      theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color.fromARGB(255, 241, 243, 246),
          appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              backgroundColor: Color.fromARGB(255, 93, 171, 255),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 20))),
      home: const Home(),
      initialRoute: '/',
      routes: {
        '/patient_data': (context) => const PatientData(),
        '/antibiotic': (context) => const Antibiotic(),
        '/data_input': (context) => const ManualAutomatico(),
        '/data_input/manual': (context) => const GramScreen(),
        '/data_input/manual/bacteria': (context) => const BacteriaScreen(),
        '/data_input/camera': (context) => const CameraInput(),
        '/results': (context) => const Results()
      },
    ),
  );
}

class Home extends StatelessWidget {
  const Home({super.key});

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
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              30, 0, 30, 0),
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
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 10),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/patient_data');
                    },
                    child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                        child: Text("Comencemos!",
                            style: GoogleFonts.readexPro(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ))))),
          ],
        ),
      ),
    );
  }
}
