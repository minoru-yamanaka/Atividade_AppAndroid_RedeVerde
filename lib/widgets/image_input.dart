import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function(File) onSelectImage;

  const ImageInput(this.onSelectImage, {Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture(ImageSource source) async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: source,
      maxWidth: 600,
    );

    if (imageFile == null) return;

    setState(() {
      _storedImage = File(imageFile.path);
    });

    widget.onSelectImage(_storedImage!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
              : const Text(
                  'Nenhuma Imagem!',
                  textAlign: TextAlign.center,
                ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.camera),
              label: const Text('Tirar Foto'),
              onPressed: () => _takePicture(ImageSource.camera),
            ),
            const SizedBox(width: 10),
            TextButton.icon(
              icon: const Icon(Icons.image),
              label: const Text('Galeria'),
              onPressed: () => _takePicture(ImageSource.gallery),
            ),
          ],
        ),
      ],
    );
  }
}