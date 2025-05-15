import 'package:flutter/material.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:iconsax/iconsax.dart';

class MySignUpAppbar extends StatelessWidget {
  final String pageText;
  const MySignUpAppbar({super.key, required this.pageText});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //profile pics
          MyCircleButtons(
            iconSize: 30,
            theIcon: Iconsax.arrow_left_2,
            iconColor: Colors.black,
            backgroundColor: AppColors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
          ),

          SizedBox(
            width: 10,
          ),

          //column: 2 rows of text
          Expanded(
            child: Center(
              child: Text(
                pageText,
                style: TextStyle(
                  fontSize: 22,
                  color: AppColors.neutral,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          //icon notification

          MyCircleButtons(
            theIcon: Icons.help_outline_rounded,
            backgroundColor: AppColors.transparent,
            iconColor: AppColors.neutral,
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
