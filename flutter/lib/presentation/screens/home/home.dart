import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: MaterialColor(primary, swatch),
        automaticallyImplyLeading: false,
        title: const Text(
          'Apptibiograma',
        ),
        actions: const [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // Generated code for this Image Widget...
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

            // Generated code for this Container Widget...
            Align(
              alignment: const AlignmentDirectional(0, 1),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Container(
                  width: 300,
                  height: 178,
                  decoration: BoxDecoration(
                    //color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                      child: Text(
                        'Antes de continuar por favor lea los términos y condiciones. Si continúa estará aceptando los términos y condiciones',
                        //style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Generated code for this Container Widget...
            Container(
              width: 315,
              height: 100,
              decoration: const BoxDecoration(
                  //color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
              child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('¡Comencemos!'),

                    /*No sé cómo modificarle el style xd
                    style: ButtonStyle(
                  
                  options: FFButtonOptions(
                    height: 40,
                    padding: EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                    iconPadding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
    }
                ),*/
                  )),
            )
          ],
        ),
      ),
    );
  }
}
