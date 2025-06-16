import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:video_player/video_player.dart';

class FullscreenMediaViewer extends StatefulWidget {
  final AssetEntity asset;
  const FullscreenMediaViewer({super.key, required this.asset});

  @override
  State<FullscreenMediaViewer> createState() => _FullscreenMediaViewerState();
}

class _FullscreenMediaViewerState extends State<FullscreenMediaViewer> {
  VideoPlayerController? _controller;
  bool _videoError = false;

  @override
  void initState() {
    super.initState();
    if (widget.asset.type == AssetType.video) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final file = await widget.asset.file;
        if (file != null) {
          // Copy to a persistent location
          final appDir = await getApplicationDocumentsDirectory();
          final localFile =
              File('${appDir.path}/${file.uri.pathSegments.last}');
          await file.copy(localFile.path);

          _controller = VideoPlayerController.file(localFile);
          try {
            await _controller!.initialize();
            setState(() {});
            _controller?.play();
          } catch (e) {
            setState(() {
              _videoError = true;
            });
          }
        } else {
          setState(() {
            _videoError = true;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: widget.asset.type == AssetType.image
              ? AssetEntityImage(widget.asset, fit: BoxFit.contain)
              : (_controller != null && _controller!.value.isInitialized)
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : _videoError
                      ? Text('Failed to load video',
                          style: TextStyle(color: Colors.white))
                      : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
