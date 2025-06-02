import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spotlight/components/colors.dart';
import 'package:video_player/video_player.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

enum PostMode { video, photo, text }

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  PostMode _mode = PostMode.photo; // Default mode is photo
  String? _lastImagePath;
  bool _isRecording = false;
  String? _lastVideoPath;
  File? _image;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: Text(
          'Create a post',
          style: GoogleFonts.roboto(
              color: AppColors.background,
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.close,
            color: AppColors.background,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Camera preview or text input
          if (_mode == PostMode.photo || _mode == PostMode.video)
            FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          else
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: "Type your post...",
                    hintStyle: TextStyle(color: Colors.white54),
                    border: OutlineInputBorder(),
                  ),
                  maxLines: null,
                ),
              ),
            ),

          // Row of Mode Selector, and capture Button
          Positioned(
            left: 0,
            right: 0,
            bottom: 32,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // row of different Mode selector
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildModeButton(PostMode.video, "VIDEO"),
                      SizedBox(width: 16),
                      _buildModeButton(PostMode.photo, "PHOTO"),
                      SizedBox(width: 16),
                      _buildModeButton(PostMode.text, "TEXT"),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                // Capture button (only for photo/video)
                if (_mode != PostMode.text)
                  FloatingActionButton(
                    onPressed: () async {
                      //FOR PHOTO MODE
                      if (_mode == PostMode.photo) {
                        try {
                          await _initializeControllerFuture;
                          final image = await _controller.takePicture();
                          setState(() {
                            _lastImagePath = image.path;
                          });
                          if (!context.mounted) return;
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DisplayPictureScreen(
                                imagePath: image.path,
                              ),
                            ),
                          );
                        } catch (e) {
                          print(
                              e); //note: I should try get error in a snack bar instead
                        }
                      }
                      //FOR THE VIDEO MODE
                      else if (_mode == PostMode.video) {
                        if (!_isRecording) {
                          // Start recording
                          try {
                            await _initializeControllerFuture;
                            await _controller.startVideoRecording();
                            setState(() {
                              _isRecording = true;
                            });
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          // Stop recording
                          try {
                            final video =
                                await _controller.stopVideoRecording();
                            setState(() {
                              _isRecording = false;
                              _lastVideoPath = video.path;
                            });
                            if (!context.mounted) return;
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DisplayVideoScreen(
                                  videoPath: video.path,
                                ),
                              ),
                            );
                          } catch (e) {
                            print(e);
                          }
                        }
                      }
                    },
                    backgroundColor: AppColors.transparent,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _isRecording ? Colors.red : AppColors.background,
                      ),
                      width: 74,
                      height: 74,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.background,
                          border: Border.all(
                            color: AppColors.black,
                            width: 2.0,
                          ),
                        ),
                        width: 44,
                        height: 44,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // Gallery preview (bottom right)
          Positioned(
            right: 24,
            bottom: 24,
            child: _lastImagePath != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      File(_lastImagePath!),
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  )
                : GestureDetector(
                    onTap: () async {
                      final XFile? image =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (image != null && context.mounted) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DisplayPictureScreen(
                                  imagePath: image.path,
                                )));
                      }
                    },
                    child: SizedBox(
                      width: 56,
                      height: 56,
                      child: Icon(
                        Iconsax.gallery,
                        color: AppColors.background,
                        size: 40,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Widget _buildModeButton(PostMode mode, String label) {
    final isSelected = _mode == mode;
    return GestureDetector(
      onTap: () {
        setState(() {
          _mode = mode;
        });
      },
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.white54,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 14,
        ),
      ),
    );
  }

  //function to pick image from the gallery
  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Image.file(File(imagePath)),
    );
  }
}

class DisplayVideoScreen extends StatefulWidget {
  final String videoPath;
  const DisplayVideoScreen({super.key, required this.videoPath});

  @override
  State<DisplayVideoScreen> createState() => _DisplayVideoScreenState();
}

class _DisplayVideoScreenState extends State<DisplayVideoScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.file(File(widget.videoPath))
      ..initialize().then((_) {
        setState(() {});
        _videoController.play();
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Video')),
      body: Center(
        child: _videoController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoController.value.aspectRatio,
                child: VideoPlayer(_videoController),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}
