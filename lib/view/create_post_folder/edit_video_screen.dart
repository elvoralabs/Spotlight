// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:video_editor/ui/video_viewer.dart';
// import 'package:video_editor/video_editor.dart';
// import 'package:path_provider/path_provider.dart';

// class VideoEditorScreen extends StatefulWidget {
//   final String filePath;

//   const VideoEditorScreen({Key? key, required this.filePath}) : super(key: key);

//   @override
//   State<VideoEditorScreen> createState() => _VideoEditorScreenState();
// }

// class _VideoEditorScreenState extends State<VideoEditorScreen> {
//   late final VideoEditorController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoEditorController.file(File(widget.filePath))
//       ..initialize().then((_) {
//         if (mounted) setState(() {});
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> _exportTrimmedVideo() async {
//     await _controller.exportVideo(
//       onCompleted: (file) {
//         Navigator.of(context).pop(file); // file is a File
//       },
//       onError: (error, stackTrace) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error exporting: $error')),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (!_controller.initialized) {
//       return const Scaffold(body: Center(child: CircularProgressIndicator()));
//     }

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Video'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.check),
//             onPressed: _exportTrimmedVideo,
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           AspectRatio(
//             aspectRatio: _controller.video.value.aspectRatio,
//             child: VideoViewer(controller: _controller),
//           ),
//           const SizedBox(height: 10),
//           TrimSlider(controller: _controller),
//           const SizedBox(height: 10),
//           CoverSelection(controller: _controller),
//           const SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: _exportTrimmedVideo,
//             child: const Text("Export Trimmed Video"),
//           ),
//         ],
//       ),
//     );
//   }
// }
