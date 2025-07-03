import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/main.dart';
import 'package:spotlight/models/select_media_model/selected_media_provider.dart';
import 'package:spotlight/view/create_post_folder/media_gallery.dart';
import 'package:spotlight/view/create_post_folder/pre_post_page.dart';
import 'package:spotlight/view/create_post_folder/preview_page.dart';
import 'package:spotlight/view/main_screens/select_screen.dart';
import 'package:spotlight/view/main_screens/talent_organizer_home.dart';
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
  AssetEntity? _latestImage;
  final ImagePicker _picker = ImagePicker();

  MediaGalleryScreen mg = MediaGalleryScreen();

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _initializeControllerFuture = _controller.initialize();
    _fetchLatestImage();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void switchCamera() async {
    final cameras = await availableCameras();
    final lensDirection = _controller!.description.lensDirection;
    final newCamera = cameras.firstWhere(
      (camera) => camera.lensDirection != lensDirection,
      orElse: () => cameras.first,
    );
    _controller = CameraController(newCamera, ResolutionPreset.high);
    await _controller!.initialize();
    setState(() {});
  }

  Future<void> _fetchLatestImage() async {
    final albums = await PhotoManager.getAssetPathList(type: RequestType.image);
    if (albums.isNotEmpty) {
      final recentAlbum = albums.first;
      final images = await recentAlbum.getAssetListPaged(page: 0, size: 1);
      if (images.isNotEmpty) {
        setState(() => _latestImage = images.first);
      }
    }
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: switchCamera,
              child: const Icon(Icons.cameraswitch, color: Colors.white),
            ),
          ),
        ],
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

            ///DISPLAY THE TEXT OPTION
            Center(
              child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TextPostScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Tap to type',
                        style: GoogleFonts.inter(
                            fontSize: 25, color: AppColors.background),
                      ))),
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
                          final asset = await PhotoManager.editor
                              .saveImageWithPath(image.path);
                          setState(() {
                            _lastImagePath = image.path;
                          });
                          if (!context.mounted) return;

                          // await Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) => PrePostPage(selectedMedia: [
                          //       asset
                          //     ]), // Pass an empty list or the correct AssetEntity list
                          //   ),
                          // );
                          Provider.of<SelectedMediaProvider>(context,
                                  listen: false)
                              .setSelectedMedia([asset]);
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DisplayPictureScreen(), // No need to pass selectedMedia
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
                            final asset = await PhotoManager.editor
                                .saveVideo(File(video.path));
                            setState(() {
                              _isRecording = false;
                              _lastVideoPath = video.path;
                            });
                            if (!context.mounted) return;
                            Provider.of<SelectedMediaProvider>(context,
                                    listen: false)
                                .setSelectedMedia([asset]);
                            await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PrePostPage(),
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
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MediaGalleryScreen(),
                  ),
                );
              },
              child: _latestImage != null
                  ? FutureBuilder<Uint8List?>(
                      future: _latestImage!.thumbnailDataWithSize(
                        const ThumbnailSize(64, 64),
                      ),
                      builder: (_, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData &&
                            snapshot.data != null) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.memory(
                              snapshot.data!,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                        return const SizedBox(width: 48, height: 48);
                      },
                    )
                  : SizedBox(
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
}

class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final selectedMedia =
        Provider.of<SelectedMediaProvider>(context).selectedMedia;
    final asset = selectedMedia.isNotEmpty ? selectedMedia[0] : null;

    return Scaffold(
      backgroundColor: AppColors.black,
      // appBar: AppBar(title: const Text('Display the Picture')),
      body: SafeArea(
        child: Stack(
          children: [
            asset != null
                ? AssetEntityImage(
                    asset,
                    fit: BoxFit.cover,
                  )
                : const Center(child: Text('No image selected')),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back arrow
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),

                  // Download icon
                  GestureDetector(
                    onTap: () {
                      // TODO: Add download logic
                    },
                    child: const Icon(
                      Icons.download_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 15,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Action icons
                  Row(
                    children: const [
                      _BottomIconLabel(icon: Icons.text_fields, label: 'Text'),
                      SizedBox(width: 20),
                      _BottomIconLabel(
                        icon: Icons.emoji_emotions_outlined,
                        label: 'Sticker',
                      ),
                      SizedBox(width: 20),
                      _BottomIconLabel(icon: Icons.crop, label: 'Crop'),
                    ],
                  ),

                  // Nexty button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrePostPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomIconLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const _BottomIconLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 20),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
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

class TextPostScreen extends StatefulWidget {
  const TextPostScreen({super.key});

  @override
  State<TextPostScreen> createState() => _TextPostScreenState();
}

class _TextPostScreenState extends State<TextPostScreen> {
  late TextEditingController myTextController;
  Color selectedColor = Colors.black;

  @override
  void initState() {
    super.initState();
    myTextController = TextEditingController();
    myTextController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Column(children: [
            //header
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 25,
                    color: AppColors.background,
                  ),
                ),
                Spacer(),
                if (myTextController.text.isNotEmpty)
                  MyButtons(
                      buttonText: "Post",
                      buttonBackgroundColor: AppColors.primary,
                      buttonWidth: 96,
                      buttonHeight: 32,
                      buttonTextstyle: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.background,
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SelectScreen(
                              cameras: cameras,
                            ),
                          ),
                        );
                      })
              ],
            ),
            SizedBox(
              height: 15,
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(color: selectedColor),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: TextField(
                      controller: myTextController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "What's on your mind?",
                        hintStyle:
                            TextStyle(color: Colors.white54, fontSize: 25),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                      maxLines: null,
                    ),
                  ),
                ),
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (final scolor in [
                    Colors.red,
                    Colors.purple,
                    Colors.blueAccent,
                    Colors.black,
                    Colors.yellow,
                    Colors.green,
                    Colors.pink,
                    Colors.brown,
                    Colors.grey,
                    Colors.deepOrange,
                    Colors.amber,
                  ])
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = scolor;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 2,
                                    color: selectedColor == scolor
                                        ? Colors.white
                                        : Colors.transparent)),
                            child: myColors(backgroundColor: scolor)),
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(
              height: 40,
            )
          ]),
        ),
      ),
      backgroundColor: selectedColor,
    );
  }

  Widget myColors({
    required Color backgroundColor,
  }) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: backgroundColor,
    );
  }
}
