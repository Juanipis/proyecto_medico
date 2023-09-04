import 'package:flutter/material.dart';

class Camara extends StatelessWidget {
  const Camara({
    super.key,
    String? ubicacionInfeccion,
  }) : this.ubicacionInfeccion = ubicacionInfeccion ?? 'Seleccionar';

  final String ubicacionInfeccion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Antibióticos',
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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height * 0.769,
                  decoration: BoxDecoration(
                    //color: FlutterFlowTheme.of(context).alternate,
                    border: Border.all(
                        //color: FlutterFlowTheme.of(context).primary,
                        ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        'https://i.postimg.cc/KYQnbkzf/antibiogram.webp',
                        width: 350,
                        height: 545,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(0, 1),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          //context.pushNamed('Antibioticos');
                        },
                        child: const Icon(
                          Icons.camera_outlined,
                          // color: FlutterFlowTheme.of(context).secondary,
                          size: 60,
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
