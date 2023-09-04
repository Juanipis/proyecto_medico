import 'package:flutter/material.dart';

// ignore: camel_case_types
class gram_screen extends StatelessWidget {
  const gram_screen({super.key});

  @override
  Widget build(BuildContext context) {
    null;
    return Scaffold(
      // Generated code for this AppBar Widget...
      appBar: AppBar(
        //backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        /*
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
        },*/

        title: const Text(
          'Gram',
          //style: FlutterFlowTheme.of(context).titleLarge,
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
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
                  // style: FlutterFlowTheme.of(context).headlineMedium,
                ),
              ),
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Gram +'),
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
                      ),
                    ),
                    Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Gram -'),
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
                      ),
                    ),
                  ])
            ]),
      ),
    );
  }
}
