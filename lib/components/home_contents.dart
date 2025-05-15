import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/video_liked_button.dart';

import 'colors.dart';
import 'my_circlebuttons.dart';

class HomeContents extends StatelessWidget {
  final String thumnNailUrl;
  final String profPic;
  final String profname;

  const HomeContents(
      {required this.thumnNailUrl,
      required this.profPic,
      required this.profname,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(thumnNailUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Row(
          //containing two columns: one for profile side and another for video perfomance metrics
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                //white music background button
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(11)),
                    child: Row(
                      children: [
                        MyCircleButtons(
                          theIcon: Icons.music_note_rounded,
                          backgroundColor: AppColors.black,
                          iconColor: AppColors.primary,
                          iconSize: 12,
                          radius: 10,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Music",
                          style: TextStyle(color: AppColors.black),
                        ),
                      ],
                    )),

                //row containing profile pic, name, verified button and follow button
                Row(
                  spacing: 5,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white, // border color
                          width: 2.0, // border width
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 16.0,
                        backgroundImage: AssetImage(profPic),
                      ),
                    ),
                    Text(
                      profname,
                      style: GoogleFonts.inter(
                          color: AppColors.background,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Iconsax.verify5,
                      color: Colors.blue,
                      size: 13,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 3),
                        decoration: BoxDecoration(
                            color: AppColors.transparent,
                            border: Border.all(
                                color: AppColors.background, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Follow",
                          style: GoogleFonts.inter(
                              color: AppColors.background, fontSize: 10),
                        ))
                  ],
                ),

                //text widget showing the video name
                Text(
                  "New Music Freestyle",
                  style: GoogleFonts.inter(
                    color: AppColors.background,
                  ),
                ),

                //row of text widget showing the video genre
                Text(
                  "#Talent #Business #Artiste",
                  style: GoogleFonts.inter(
                    color: AppColors.background,
                  ),
                ),

                //row of viewers images, no of views and date uploaded
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 40, // Adjust based on how many avatars and overlap
                      height: 32, // Avatar diameter (2 * radius)
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 5,
                            child: CircleAvatar(
                              radius: 10.0,
                              backgroundImage:
                                  AssetImage('assets/images/girl_two.jpg'),
                            ),
                          ),
                          Positioned(
                            left: 10,
                            top: 5, // overlapping offset
                            child: CircleAvatar(
                              radius: 10.0,
                              backgroundImage:
                                  AssetImage('assets/images/girl_three.jpg'),
                            ),
                          ),
                          Positioned(
                            left: 20,
                            top: 5,
                            child: CircleAvatar(
                              radius: 10.0,
                              backgroundImage:
                                  AssetImage('assets/images/girl_four.jpg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '22k Views | 3Days',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //icon and number under it
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  spacing: 20,
                  children: [
                    VideoLikeButton(
                      // icon: Iconsax.heart,
                      initialCount: 66,
                    ),
                    videoMetrics(theIcon: Iconsax.messages_3, theText: "22k"),
                    videoMetrics(theIcon: Iconsax.send_1, theText: "1k"),
                    videoMetrics(theIcon: Icons.bookmark, theText: "100"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

//
  Column videoMetrics({required IconData theIcon, required String theText}) {
    return Column(
      children: [
        Icon(
          theIcon,
          color: Colors.white,
        ),
        Text(
          theText,
          style: GoogleFonts.inter(color: Colors.white),
        )
      ],
    );
  }
}
