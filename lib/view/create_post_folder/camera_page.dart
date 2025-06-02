import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  // CameraController? _controller;
  // Future<void>? _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // _initCamera();
  }

  @override
  void dispose() {
    // _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        title: Text(
          'Create a posts',
          style: GoogleFonts.inter(fontSize: 15),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image != null
                ? Image.file(_image!,
                    width: 200, height: 200, fit: BoxFit.cover)
                : Text('No image selected.'),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.camera),
              icon: Icon(Icons.camera),
              label: Text("Take Photo"),
            ),
            ElevatedButton.icon(
              onPressed: () => _pickImage(ImageSource.gallery),
              icon: Icon(Icons.photo),
              label: Text("Choose from Gallery"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
}
