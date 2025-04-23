import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:spotlight/components/my_drawer.dart';
import 'package:spotlight/components/talent_button.dart';

class TalentOrganizerHome extends StatefulWidget {
  const TalentOrganizerHome({super.key});

  @override
  State<TalentOrganizerHome> createState() => _TalentOrganizerHomeState();
}

class _TalentOrganizerHomeState extends State<TalentOrganizerHome> {
  int _currentIndex = 0;

  final List<String> carouselImgList = [
    'assets/images/homeimage.png',
    'assets/images/m2.png',
    'assets/images/m3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        title: Text(
          'Spotlight',
          style: GoogleFonts.reenieBeanie(
            fontSize: 35,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Icon(Iconsax.notification),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // row of fire emoji and feature competition text
            Padding(
              padding:
                  const EdgeInsets.only(right: 12.0, left: 12.0, top: 20.0),
              child: Row(
                children: [
                  Image.asset('assets/images/emoji.png', width: 20),
                  SizedBox(width: 10.0),
                  Text('Featured Competitions', style: TextStyle(fontSize: 17)),
                ],
              ),
            ),
            SizedBox(height: 15.0),

            //carousel slider of 3 images
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: CarouselSlider(
                items: carouselImgList.map((item) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: 170,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(item),
                            fit: BoxFit.cover,
                            alignment: Alignment(0, 0.27),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mazi Got Talent Show',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                  fontFamily: 'Inter',
                                  height: 1.4,
                                ),
                              ),
                              SizedBox(height: 4.0),
                              Text(
                                '10 Million Naira Cash Prize',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'Inter',
                                ),
                              ),
                              SizedBox(height: 8.0),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10.0),
                                  minimumSize: Size(0, 0),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                                onPressed: () {},
                                child: Text('Join Now'),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 170.0,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 10),

            //carousel index indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselImgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => setState(() {
                    _currentIndex = entry.key;
                  }),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin: EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Colors.black54
                          : Colors.grey.shade400,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 20.0),

            //top talent text widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Image.asset('assets/images/cup.png', width: 20),
                  SizedBox(width: 10.0),
                  Text('Top Talents', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),
            SizedBox(height: 20),

            //genre filter buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TalentButton(
                    title: 'Music',
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  TalentButton(
                    title: 'Art',
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.black,
                  ),
                  TalentButton(
                    title: 'Dance',
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.black,
                  ),
                  TalentButton(
                    title: 'Fashion',
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.black,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // ⬇️ This is the scrollable part only
            SizedBox(
              height: 450,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
                child: ListView(
                  children: [
                    homeContents(
                        thumnNailUrl: "assets/images/m1.jpg",
                        profPic: "assets/images/girl.jpg",
                        profname: "Bisola Adegoke"),
                    homeContents(
                        thumnNailUrl: "assets/images/m2.png",
                        profPic: "assets/images/girl.jpg",
                        profname: "Chinedum Okafor"),
                    homeContents(
                        thumnNailUrl: "assets/images/girl.jpg",
                        profPic: "assets/images/girl.jpg",
                        profname: "Chinedum Okafor"),
                    homeContents(
                        thumnNailUrl: "assets/images/m3.png",
                        profPic: "assets/images/man2.jpg",
                        profname: "Adekunle John"),
                    SizedBox(height: 25),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Container homeContents(
      {required String thumnNailUrl,
      required String profPic,
      required String profname}) {
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        MyCircleButtons(
                          theIcon: Icons.music_note_rounded,
                          backgroundColor: AppColors.black,
                          iconColor: AppColors.primary,
                          iconSize: 12,
                          radius: 7,
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
                    videoMetrics(theIcon: Iconsax.heart, theText: "66k"),
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
