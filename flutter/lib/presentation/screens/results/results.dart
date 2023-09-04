import 'package:flutter/material.dart';

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
class Results extends StatelessWidget {
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
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Text("Resultados"),
        ),
        body: Center(
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0x33000000),
                        offset: Offset(0, 2),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                              child: TextStyleExample(
                                name: 'Resultados del análisis', style: textTheme.titleLarge!)
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                              child: TextStyleExample(
                                name: 'Bacteria: blbabalbalba', style: textTheme.labelLarge!),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(20, 5, 0, 0),
                              child: TextStyleExample(
                                name: 'Organo: Corazón', style: textTheme.labelLarge!),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(50, 5, 0, 0),
                              child: TextStyleExample(
                                name: '- Germen blabla\n- Germen blabla 2', 
                                style: textTheme.labelLarge!)
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 0),
                              child: TextStyleExample(
                                name: 'Resultados del tratamiento:', style: textTheme.labelLarge!)
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 2, 0, 0),
                              child: TextStyleExample(
                                name: 'Opción 1: Lorem ipsum dolor\n2 gml sav chora', 
                                style: textTheme.labelLarge!)
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 2, 0, 0),
                              child: TextStyleExample(
                                name: 'Opción 2: Lorem ipsum dolor\n2 gml sav chora', 
                                style: textTheme.labelLarge!)
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 2, 0, 0),
                              child: TextStyleExample(
                                name: 'Opción 2: Lorem ipsum dolor\n2 gml sav chora', 
                                style: textTheme.labelLarge!)
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(10, 2, 0, 0),
                              child: TextStyleExample(
                                name: 'Opción 2: Lorem ipsum dolor\n2 gml sav chora', 
                                style: textTheme.labelLarge!)
                            ),
                          ),
                        ],
                      ),
                ),
                ),
              SizedBox(
                height: 50,
              ),

              ElevatedButton(
                        onPressed: () {
                          Navigator.popUntil(context, ModalRoute.withName('/'));
                        },
                        child: Text("Continuar"),
                ),
            ],
          )));
  }
}
