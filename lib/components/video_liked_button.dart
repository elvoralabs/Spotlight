import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class VideoLikeButton extends StatefulWidget {
  final int initialCount;

  const VideoLikeButton({
    super.key,
    required this.initialCount,
  });

  @override
  State<VideoLikeButton> createState() => _VideoLikeButtonState();
}

class _VideoLikeButtonState extends State<VideoLikeButton> {
  bool isLiked = false;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    likeCount = widget.initialCount;
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        likeCount++;
      } else {
        likeCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleLike,
      child: Column(
        children: [
          Icon(
            isLiked ? Iconsax.heart5 : Iconsax.heart, // filled vs outline
            color: isLiked ? Colors.red : Colors.white,
          ),
          Text(
            "${likeCount}k",
            style: GoogleFonts.inter(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
