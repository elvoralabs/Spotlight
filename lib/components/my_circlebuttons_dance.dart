import 'package:flutter/material.dart';
import 'package:spotlight/components/colors.dart';

class MyCircleButtonsDance extends StatelessWidget {
  final Widget image;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final Color? iconColor;
  final double? imageSize;
  final double? radius;
  const MyCircleButtonsDance(
      {super.key,
      required this.image,
      required this.backgroundColor,
      this.onTap,
      this.radius,
      this.iconColor,
      this.imageSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius ?? 20, // Default radius is 30 if not provided
        backgroundColor: backgroundColor,
        child: image, // Default size is 30 if not provided
      ),
    );
  }
}
