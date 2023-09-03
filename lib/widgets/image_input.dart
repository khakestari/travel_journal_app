import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  // const ImageInput({super.key});
  final Function onSelectImage;
  ImageInput(this.onSelectImage);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;
  Future<void> _takePicture(String imageSource) async {
    final picker = ImagePicker();

    final imageFile = await picker.pickImage(
      source: imageSource == 'camera'
          ? ImageSource.camera
          : imageSource == 'gallery'
              ? ImageSource.gallery
              : ImageSource.camera,
      maxHeight: 600,
    );
    if (imageFile == null) {
      return;
    }
    setState(() {
      _storedImage = File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage =
        await File(imageFile.path).copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height: 100,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.red)),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'No image taken',
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(width: 10),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton.icon(
                onPressed: () => _takePicture('camera'),
                style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 20),
                    backgroundColor: const Color(0xFF795548)),
                icon: const Icon(Icons.camera),
                label: const Text('Take Picture')),
            TextButton.icon(
                onPressed: () => _takePicture('gallery'),
                style: TextButton.styleFrom(
                    minimumSize: Size(double.infinity, 20),
                    backgroundColor: const Color(0xFF795548)),
                icon: const Icon(Icons.add_photo_alternate),
                label: const Text('Browse Gallery')),
          ],
        )),
      ],
    );
  }
}
