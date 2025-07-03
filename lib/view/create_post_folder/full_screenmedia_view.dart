import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotlight/models/select_media_model/selected_media_provider.dart';
// import 'package:spotlight/view/create_post_folder/edit_video_screen.dart';
// import 'package:spotlight/view/create_post_folder/trim_video.dart';
import 'package:photo_manager/photo_manager.dart';
// import 'package:video_trimmer/video_trimmer.dart';

class FullscreenMediaViewer extends StatelessWidget {
  const FullscreenMediaViewer({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedMediaProvider = Provider.of<SelectedMediaProvider>(context);
    final asset = selectedMediaProvider.selectedMedia.isNotEmpty
        ? selectedMediaProvider.selectedMedia.first
        : null;

    if (asset == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('No Media Selected')),
        body: const Center(child: Text('Please select a media file.')),
      );
    }

    // If the asset is a video, navigate to TrimVideoPage
    if (asset.type == AssetType.video) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final file = await asset.file;
        if (file != null) {
          // final editedFile = await Navigator.of(context).push<File?>(
          //   MaterialPageRoute(
          //     builder: (context) => VideoEditorScreen(filePath: file.path),
          //   ),
          // );

          // If a trimmed video was returned, update the selectedMediaProvider
          // if (editedFile != null) {
          //   final newAsset = await PhotoManager.editor.saveVideo(editedFile);

          //   if (newAsset != null) {
          //     selectedMediaProvider.clearMedia(); // optional
          //     selectedMediaProvider.addMedia(newAsset);
          //   }
          // }

          // Pop this screen or show something else
          Navigator.of(context).pop();
        }
      });

      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // If the asset is an image, display it
    return Scaffold(
      appBar: AppBar(title: const Text('Full Screen Media')),
      body: FutureBuilder<Uint8List?>(
        future: asset.originBytes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Center(
              child: Image.memory(snapshot.data!),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:photo_manager/photo_manager.dart';
// import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
// import 'package:video_player/video_player.dart';

// class FullscreenMediaViewer extends StatefulWidget {
//   final AssetEntity asset;
//   const FullscreenMediaViewer({super.key, required this.asset});

//   @override
//   State<FullscreenMediaViewer> createState() => _FullscreenMediaViewerState();
// }

// class _FullscreenMediaViewerState extends State<FullscreenMediaViewer> {
//   VideoPlayerController? _controller;
//   bool _videoError = false;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.asset.type == AssetType.video) {
//       WidgetsBinding.instance.addPostFrameCallback((_) async {
//         final file = await widget.asset.file;
//         if (file != null) {
//           // Copy to a persistent location
//           final appDir = await getApplicationDocumentsDirectory();
//           final localFile =
//               File('${appDir.path}/${file.uri.pathSegments.last}');
//           await file.copy(localFile.path);

//           _controller = VideoPlayerController.file(localFile);
//           try {
//             await _controller!.initialize();
//             setState(() {});
//             _controller?.play();
//           } catch (e) {
//             setState(() {
//               _videoError = true;
//             });
//           }
//         } else {
//           setState(() {
//             _videoError = true;
//           });
//         }
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: GestureDetector(
//         onTap: () => Navigator.pop(context),
//         child: Center(
//           child: widget.asset.type == AssetType.image
//               ? AssetEntityImage(widget.asset, fit: BoxFit.contain)
//               : (_controller != null && _controller!.value.isInitialized)
//                   ? AspectRatio(
//                       aspectRatio: _controller!.value.aspectRatio,
//                       child: VideoPlayer(_controller!),
//                     )
//                   : _videoError
//                       ? Text('Failed to load video',
//                           style: TextStyle(color: Colors.white))
//                       : CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
// }
