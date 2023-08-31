import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ),
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apptiobiograma'),
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
              alignment: const AlignmentDirectional(0,1),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                child: Container(
                  width: 300,
                  height: 178,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white
                  ),
                  child: const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
                    child: Text(
            'Antes de continuar por favor lea los términos y condiciones. Si continúa estará aceptando los términos y condiciones'
                    )
                  )
                )
              ),
            ),
            Container(
              width: 315,
              height: 100,
              
            )
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
