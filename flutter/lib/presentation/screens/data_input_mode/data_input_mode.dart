import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DataInputMode extends StatelessWidget {
  const DataInputMode({
    super.key,
    String? ubicacionInfeccion,
  }) : ubicacionInfeccion = ubicacionInfeccion ?? 'Seleccionar';
  final String ubicacionInfeccion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              'Modo de entrada',
              textAlign: TextAlign.left,
              style: GoogleFonts.getFont('Outfit'),
            ),
            centerTitle: false,
            leading: IconButton(
              // ignore: prefer_const_constructors
              icon: BackButtonIcon(),
              onPressed: () {
                Navigator.pop(context);
              },
            )
            //Icons.arrow_back_rounded),
            ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                      child: Text(
                        '¿Cómo deseas ingresar los datos?',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, -1),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Center(
                                child: Ink(
                                  decoration: const ShapeDecoration(
                                    color: Colors.lightBlueAccent,
                                    shape: CircleBorder(),
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/gram');
                                      },
                                      color: Colors.lightBlueAccent,
                                      icon: const Icon(
                                        Icons.handyman,
                                        size: 70,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Text(
                                  'Entrada manual',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, -1),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Center(
                                child: Ink(
                                  decoration: const ShapeDecoration(
                                    color: Colors.lightBlueAccent,
                                    shape: CircleBorder(),
                                  ),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/camara');
                                      },
                                      color: Colors.amber,
                                      icon: const Icon(
                                        Icons.camera_alt_rounded,
                                        size: 70,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Text(
                                  'Entrada automática',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
