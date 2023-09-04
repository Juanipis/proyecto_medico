import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types
class gram_screen extends StatelessWidget {
  const gram_screen({super.key});

  @override
  Widget build(BuildContext context) {
    null;
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Gram',
            textAlign: TextAlign.left,
            style: GoogleFonts.getFont('Outfit'),
          ),
          centerTitle: false,
          leading: IconButton(
            // ignore: prefer_const_constructors
            icon: BackButtonIcon(),
            onPressed: () async {
              Navigator.pushNamed(context, '/patient_data');
            },
          )
          //Icons.arrow_back_rounded),
          ),
      body: SafeArea(
        top: true,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Generated code for this Text Widget...
              const Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                child: Text(
                  'Listado de bacterias',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                  // style: FlutterFlowTheme.of(context).headlineMedium,
                ),
              ),
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 200,
                        width: 200,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.orange,
                              backgroundColor: Colors.orange),
                          onPressed: () {},
                          child: const Text(
                            'Gram +',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 40,
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 200,
                        width: 200,
                        child: TextButton(
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.orange,
                              backgroundColor: Colors.orange),
                          onPressed: () {},
                          child: const Text(
                            'Gram -',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 40,
                            ),
                          ),
                        )),

                    /*
          options: FFButtonOptions(
            padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
            iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
            color: FlutterFlowTheme.of(context).secondary,
            textStyle: TextStyle(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              fontWeight: FontWeight.w500,
              fontSize: 40,
            ),
            elevation: 3,
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(16),*/
                  ])
            ]),
      ),
    );
  }
}

class GramScreen extends StatelessWidget {
  const GramScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextStyleExample(
                name: 'Listado de bacterias', style: textTheme.headlineSmall!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 300,
                            height: 100,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.orange)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/bacteria');
                                },
                                child: const Text(
                                  "Gram +",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ))),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                            width: 300,
                            height: 100,
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blue)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/bacteria');
                                },
                                child: const Text(
                                  "Gram -",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ))),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TextStyleExample extends StatelessWidget {
  const TextStyleExample({
    super.key,
    required this.name,
    required this.style,
  });

  final String name;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(name, style: style),
    );
  }
}
