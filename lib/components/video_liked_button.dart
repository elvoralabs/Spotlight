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
            isLiked
                ? Icons.favorite
                : Icons.favorite_border_outlined, // filled vs outline
            color: isLiked ? Colors.red : Colors.white, size: 24,
          ),
          Text(
            "${likeCount}k",
            style: GoogleFonts.inter(color: Colors.white, fontSize: 11.0),
          ),
        ],
      ),
    );
  }
}
