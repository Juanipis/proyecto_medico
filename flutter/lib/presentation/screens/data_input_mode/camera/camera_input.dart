import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CameraInput extends StatelessWidget {
  const CameraInput({
    super.key,
    String? ubicacionInfeccion,
  }) : this.ubicacionInfeccion = ubicacionInfeccion ?? 'Seleccionar';

  final String ubicacionInfeccion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Antibióticos',
            textAlign: TextAlign.left,
            style: GoogleFonts.getFont('Outfit'),
          ),
          centerTitle: false,
          leading: IconButton(
            // ignore: prefer_const_constructors
            icon: BackButtonIcon(),
            onPressed: () async {
              Navigator.pop(context);
            },
          )
          //Icons.arrow_back_rounded),
          ),
      body: SafeArea(
        //top: true,
        child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 360,
                  height: 550,
                  decoration: BoxDecoration(
                    // color: Colors.white30,
                    border: Border.all(color: Colors.lightBlueAccent),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://i.postimg.cc/KYQnbkzf/antibiogram.webp',
                        width: 350,
                        height: 545,
                        //fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          Navigator.pushNamed(context, '/antibiotic');
                        },
                        child: const Icon(
                          Icons.camera_outlined,
                          color: Colors.orange,
                          // color: FlutterFlowTheme.of(context).secondary,
                          size: 80,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
