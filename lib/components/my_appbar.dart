import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:iconsax/iconsax.dart';

class MyAppbar extends StatelessWidget {
  final String pageTitle;
  const MyAppbar({super.key, required this.pageTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyCircleButtons(
          theIcon: Icons.keyboard_arrow_left,
          backgroundColor: AppColors.transparent,
          iconColor: AppColors.black,
          onTap: () {},
        ),
        Expanded(
          child: Center(
            child: Text(
              pageTitle,
              style: GoogleFonts.inter(
                  fontSize: 20,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),

        //icon setting
        // MyCircleButtons(
        //   theIcon: Iconsax.notification,
        //   backgroundColor: AppColors.transparent,
        //   onTap: () {},
        // ),
      ],
    );
  }
}
