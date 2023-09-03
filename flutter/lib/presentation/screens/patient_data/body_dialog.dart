import 'package:flutter/material.dart';
import 'dart:async';

Future<int?> bodyDialog(
  BuildContext context,
  double height,
  double width,
  List<String> infections,
) async {
  Completer<int?> completer = Completer<int?>();

  void handleButtonClick(int index) {
    Navigator.pop(context);
    completer.complete(index);
  }

  void handleDialogClose() {
    Navigator.pop(context);
    completer.complete(-1);
  }

  showDialog(
      context: context,
      builder: (context) => Dialog.fullscreen(
              child: Padding(
            padding: const EdgeInsets.all(0),
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Ubicación de infección"),
                leading: IconButton(
                  onPressed: () {
                    handleDialogClose();
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        handleDialogClose();
                      },
                      child: const Text("Cerrar"))
                ],
              ),
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Text(
                        "Seleccione la ubicación de la infección",
                      ),
                      SizedBox(
                        height: height * 0.8,
                        width: width,
                        child: Stack(fit: StackFit.loose, children: [
                          Positioned(
                            left: width / 2 - 100,
                            child: Image(
                              image: const AssetImage("assets/images/body.png"),
                              height: height * 0.8,
                            ),
                          ),
                          // Left side
                          infectionButton(height * 0.03, width / 2 - 170,
                              handleButtonClick, infections, 0),
                          infectionButton(height * 0.2, width / 2 - 150,
                              handleButtonClick, infections, 1),
                          infectionButton(height * 0.4, width / 2 - 170,
                              handleButtonClick, infections, 2),
                          infectionButton(height * 0.55, width / 2 - 170,
                              handleButtonClick, infections, 3),
                          infectionButton(height * 0.7, width / 2 - 130,
                              handleButtonClick, infections, 4),
                          // Right side
                          infectionButton(height * 0.05, width / 2 + 70,
                              handleButtonClick, infections, 5),
                          infectionButton(height * 0.2, width / 2 + 70,
                              handleButtonClick, infections, 6),
                          infectionButton(height * 0.4, width / 2 + 60,
                              handleButtonClick, infections, 7),
                          infectionButton(height * 0.55, width / 2 + 50,
                              handleButtonClick, infections, 8),
                        ]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )));
  return completer.future;
}

Positioned infectionButton(
    double top,
    double left,
    void Function(int index) handleButtonClick,
    List<String> infections,
    int index) {
  return Positioned(
    // Left side
    top: top,
    left: left,
    width: 120,
    child: ElevatedButton(
        onPressed: () {
          handleButtonClick(index);
        },
        child: Text(
          infections[index],
          textAlign: TextAlign.center,
        )),
  );
}
