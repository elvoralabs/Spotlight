import 'package:flutter/material.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:iconsax/iconsax.dart';

class MySearchbox extends StatelessWidget {
  const MySearchbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            MyCircleButtons(
                theIcon: Iconsax.filter_search,
                backgroundColor: AppColors.background),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '',
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(
              Iconsax.search_favorite_1,
              color: AppColors.primary,
            ),
          ],
        ));
  }
}
