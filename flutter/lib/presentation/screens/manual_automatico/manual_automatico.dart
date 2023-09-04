import 'package:flutter/material.dart';

class ManualAutomatico extends StatelessWidget {
  const ManualAutomatico({
    super.key,
    String? ubicacionInfeccion,
  }) : ubicacionInfeccion = ubicacionInfeccion ?? 'Seleccionar';
  final String ubicacionInfeccion;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(),
      child: Scaffold(
        //backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          /*leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30,
            ),
            onPressed: () async {
              context.safePop();
            },
          ),*/
          title: const Text(
            'Modo de entrada',
            // style: FlutterFlowTheme.of(context).titleLarge,
          ),
          actions: const [],
          centerTitle: false,
          elevation: 0,
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
                        //style: FlutterFlowTheme.of(context).headlineMedium,
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
                              TextButton.icon(
                                  onPressed: () async {},
                                  icon: const Icon(
                                    Icons.handyman,
                                    size: 80,
                                  ),
                                  /*FaIcon(
                                    FontAwesomeIcons.pencilRuler,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 80,
                                  ),*/

                                  label: Text('')),
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Text(
                                  'Entrada manual',
                                  //style: FlutterFlowTheme.of(context).bodyMedium,
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
                              TextButton.icon(
                                  onPressed: () async {},
                                  icon: const Icon(
                                    Icons.camera,
                                    size: 80,
                                  ),
                                  /*FaIcon(
                                    FontAwesomeIcons.pencilRuler,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 80,
                                  ),*/

                                  label: const Text('')),
                              /* FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 70,
                                borderWidth: 1,
                                buttonSize: 130,
                                fillColor: FlutterFlowTheme.of(context).primary,
                                icon: Icon(
                                  Icons.camera_alt,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 80,
                                ),
                                onPressed: () async {
                                  context.pushNamed('Camara');
                                },
                              ),*/
                              const Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                                child: Text(
                                  'Entrada automática',
                                  // style:FlutterFlowTheme.of(context).bodyMedium,
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
