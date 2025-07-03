// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:spotlight/models/select_media_model/selected_media_provider.dart';
// import 'package:video_trimmer/video_trimmer.dart';

// // class VideoPickerScreen extends StatefulWidget {
// //   const VideoPickerScreen({super.key, });
// //   @override
// //   State<VideoPickerScreen> createState() => _VideoPickerScreenState();

// // }

// // class _VideoPickerScreenState extends State<VideoPickerScreen> {
// //   final ImagePicker _picker = ImagePicker();
// //   final Trimmer _trimmer = Trimmer();

// //   Future<void> _pickVideo() async {
// //     final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
// //     if (video != null) {
// //       await _trimmer.loadVideo(videoFile: File(video.path));
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => TrimEditorScreen(trimmer: _trimmer),
// //         ),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //      final selectedMedia =
// //         Provider.of<SelectedMediaProvider>(context).selectedMedia;

// //     return Scaffold(
// //       appBar: AppBar(title: Text("Select Video")),
// //       body: Center(
// //         child: ElevatedButton(
// //           onPressed: _pickVideo,
// //           child: Text("Pick a Video"),
// //         ),
// //       ),
// //     );
// //   }
// // }

// class TrimEditorScreen extends StatefulWidget {
//   final Trimmer trimmer;
//   const TrimEditorScreen({super.key, required this.trimmer});

//   @override
//   State<TrimEditorScreen> createState() => _TrimEditorScreenState();
// }

// class _TrimEditorScreenState extends State<TrimEditorScreen> {
//   double _startValue = 0.0;
//   double _endValue = 0.0;
//   bool _isPlaying = false;
//   bool _isTrimming = false;

//   void _saveTrimmedVideo() async {
//     setState(() => _isTrimming = true);
//     await widget.trimmer
//         .saveTrimmedVideo(
//       startValue: _startValue,
//       endValue: _endValue,
//       onSave: (String? outputPath) {},
//     )
//         .then((outputPath) {
//       setState(() => _isTrimming = false);
//       // if (outputPath != null) {
//       //   ScaffoldMessenger.of(context).showSnackBar(
//       //     SnackBar(content: Text('Trimmed video saved at: $outputPath')),
//       //   );
//       // }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final selectedMedia =
//         Provider.of<SelectedMediaProvider>(context).selectedMedia;

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text("Trim"),
//         actions: [
//           TextButton(
//             onPressed: _isTrimming ? null : _saveTrimmedVideo,
//             child: Text("Done", style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(child: VideoViewer(trimmer: widget.trimmer)),
//           TrimViewer(
//             trimmer: widget.trimmer,
//             viewerHeight: 60.0,
//             maxVideoLength: Duration(minutes: 3),
//             onChangeStart: (value) => _startValue = value,
//             onChangeEnd: (value) => _endValue = value,
//             onChangePlaybackState: (isPlaying) =>
//                 setState(() => _isPlaying = isPlaying),
//           ),
//           TextButton(
//             onPressed: () async {
//               bool playbackState = await widget.trimmer.videoPlaybackControl(
//                 startValue: _startValue,
//                 endValue: _endValue,
//               );
//               setState(() => _isPlaying = playbackState);
//             },
//             child: Icon(
//               _isPlaying ? Icons.pause : Icons.play_arrow,
//               color: Colors.white,
//               size: 30,
//             ),
//           ),
//           SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
