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
