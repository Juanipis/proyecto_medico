// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:proyecto_medico/presentation/screens/data_input_mode/camera/ImageDisplayScreen.dart';

late List<CameraDescription> cameras;

class CameraInput extends StatefulWidget {
  const CameraInput({
    super.key,
    String? ubicacionInfeccion,
  }) : ubicacionInfeccion = ubicacionInfeccion ?? 'Seleccionar';

  final String ubicacionInfeccion;

  @override
  _CameraInputState createState() => _CameraInputState();
}

class _CameraInputState extends State<CameraInput> {
  CameraController? _controller;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  _initCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      _controller!.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    }
  }

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
          icon: const BackButtonIcon(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
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
                  border: Border.all(color: Colors.lightBlueAccent),
                ),
                child: _controller == null || !_controller!.value.isInitialized
                    ? const Center(child: CircularProgressIndicator())
                    : CameraPreview(_controller!),
              ),
              Flexible(
                child: Align(
                  alignment: const AlignmentDirectional(0, 1),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (_controller != null &&
                            _controller!.value.isInitialized) {
                          final Directory? extDir =
                              await getExternalStorageDirectory();
                          if (extDir == null) {
                            print(
                                "Error: No se pudo obtener el directorio de almacenamiento externo.");
                            return; // Salir del método onTap si no se puede obtener el directorio.
                          }
                          final String dirPath =
                              '${extDir.path}/proyecto_medico';
                          await Directory(dirPath).create(recursive: true);
                          final String filePath =
                              '$dirPath/${DateTime.now().millisecondsSinceEpoch}.jpg';

                          if (_controller!.value.isTakingPicture) {
                            // Si ya se está tomando una foto, no hagas nada.
                            return;
                          }
                          try {
                            XFile file = await _controller!.takePicture();
                            await file.saveTo(filePath);
                            print("Imagen guardada en $filePath");

                            // Navegar a la nueva pantalla
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ImageDisplayScreen(imagePath: filePath),
                              ),
                            );
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      child: const Icon(
                        Icons.camera_outlined,
                        color: Colors.orange,
                        size: 80,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
