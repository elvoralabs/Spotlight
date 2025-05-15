import 'package:flutter/material.dart';
import 'package:spotlight/components/colors.dart';

class MyCircleButtons extends StatelessWidget {
  final IconData theIcon;
  final Color backgroundColor;
  final VoidCallback? onTap;
  final Color? iconColor;
  final double? iconSize;
  final double? radius;
  const MyCircleButtons(
      {super.key,
      required this.theIcon,
      required this.backgroundColor,
      this.onTap,
      this.radius,
      this.iconColor,
      this.iconSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius ?? 20, // Default radius is 30 if not provided
        backgroundColor: backgroundColor,
        child: Icon(theIcon,
            color: iconColor ?? AppColors.textPrimary,
            size: iconSize ?? 27), // Default size is 30 if not provided
      ),
    );
  }
}
