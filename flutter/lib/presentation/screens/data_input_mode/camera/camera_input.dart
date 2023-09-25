import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

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
                    ? Center(child: CircularProgressIndicator())
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
                          final Directory extDir =
                              await getApplicationDocumentsDirectory();
                          final String dirPath =
                              '${extDir.path}/Pictures/flutter_camera';//en esta direccion se guardaran las fotos
                          await Directory(dirPath).create(recursive: true);
                          final String filePath =
                              '$dirPath/${DateTime.now().millisecondsSinceEpoch}.jpg'; /* Estamos definiendo la ruta completa del archivo donde se guardará la imagen. La imagen tendrá un nombre basado en la hora actual (en milisegundos desde la "epoch", que es una fecha y hora específica utilizada como punto de referencia) y tendrá una extensión .jpg.*/

                          if (_controller!.value.isTakingPicture) {
                            // Si ya se está tomando una foto, no hagas nada.
                            return;
                          }

                          try {
                            XFile file = await _controller!.takePicture();
                            await file.saveTo(filePath);
                            print("Imagen guardada en $filePath");
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
