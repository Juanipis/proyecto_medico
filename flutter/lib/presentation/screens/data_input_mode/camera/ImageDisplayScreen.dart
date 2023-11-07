import 'dart:io';

import 'package:flutter/material.dart';

class ImageDisplayScreen extends StatelessWidget {
  final String imagePath;

  const ImageDisplayScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imagen Capturada'),
      ),
      body: Center(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.file(File(imagePath)),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {},
                child: const Icon(
                  Icons.camera_outlined,
                  color: Colors.orange,
                  size: 80,
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {},
                child: const Icon(
                  Icons.confirmation_num_outlined,
                  color: Colors.orange,
                  size: 80,
                ),
              ),
            ]),
      ),
    );
  }
}
