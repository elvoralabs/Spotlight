import 'package:flutter/material.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:iconsax/iconsax.dart';

class MyAppbar extends StatefulWidget {
  const MyAppbar({super.key});

  @override
  State<MyAppbar> createState() => _MyAppbarState();
}

class _MyAppbarState extends State<MyAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //profile pics
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/man1.jpg'),
            radius: 25,
          ),

          SizedBox(
            width: 10,
          ),

          //column: 2 rows of text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back,",
                style: TextStyle(fontSize: 16, color: AppColors.textPrimary),
              ),
              Text(
                "John Doe",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          Spacer(),

          //icon notification

          MyCircleButtons(
            theIcon: Iconsax.notification,
            backgroundColor: AppColors.secondary,
            onTap: () {},
          ),
          SizedBox(
            width: 10,
          ),

          //icon setting
          MyCircleButtons(
            theIcon: Iconsax.setting_2,
            backgroundColor: AppColors.secondary,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
