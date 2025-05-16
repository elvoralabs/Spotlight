import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/view/homepages/random.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:spotlight/components/my_drawer.dart';
import 'package:spotlight/view/homepages/comments_screen.dart';
import 'package:spotlight/view/profile%20screens/notificationsPage.dart';
import 'package:spotlight/models/video_list.dart';

class TalentOrganizerHome extends StatefulWidget {
  const TalentOrganizerHome({super.key});

  @override
  State<TalentOrganizerHome> createState() => _TalentOrganizerHomeState();
}

class _TalentOrganizerHomeState extends State<TalentOrganizerHome> {
  int _currentCarouselIndex = 0;

  int _selectGenre = 0;
  late final List<String> genresList = ['Music', 'Art', 'Dance'];

  //this is to call the instance of class VideoList from another file
  VideoList videoList = VideoList();

  // Track the selected talent here
  String selectedTalent = 'Music';

  final List<String> carouselImgList = [
    'assets/images/bab.png',
    'assets/images/bab.png',
    'assets/images/bab.png',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredVideos = videoList.videos
        .where((video) => video['genre'] == genresList[_selectGenre])
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Spotlight',
          style: GoogleFonts.reenieBeanie(fontSize: 32),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TalentOrganizerHomeTest(),
                        ),
                      );
                    },
                    child: Icon(
                      Iconsax.notification,
                      size: 20,
                    )),
                SizedBox(width: 40.0),
                Icon(Icons.search, size: 25.0),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          // row of fire emoji and feature competition text
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: Row(
              children: [
                Image.asset('assets/images/emoji.png', width: 20),
                SizedBox(width: 10.0),
                Text('Featured Competitions',
                    style: GoogleFonts.roboto(
                        fontSize: 16, fontWeight: FontWeight.w400)),
              ],
            ),
          ),

          //container of carouselSlider
          CarouselSlider(
            items: carouselImgList.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 12.0),
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item),
                        fit: BoxFit.cover,
                        alignment: Alignment(0, 0.001),
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dancing Carnival',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '7 Million Naira Cash Prize',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.black,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  tapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  minimumSize: Size(0, 0),
                                ),
                                onPressed: () {},
                                child: Text('Join Now'),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 35,
                                    width: 105,
                                    child: Stack(
                                      children: List.generate(5, (index) {
                                        return Positioned(
                                          left: index * 15.0,
                                          top: 5,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: CircleAvatar(
                                              radius: 13.0,
                                              backgroundImage: AssetImage(
                                                'assets/images/i${index + 1}.png',
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                        ..add(Positioned(
                                          left: 76,
                                          top: 5,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 13.0,
                                            child: Text(
                                              '2.4k',
                                              style: TextStyle(fontSize: 8),
                                            ),
                                          ),
                                        )),
                                    ),
                                  ),
                                  Text(
                                    '7Days to Go',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 164.0,
              viewportFraction: 1.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() => _currentCarouselIndex = index);
              },
            ),
          ),
          // === Carousel indicator ===
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: carouselImgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => setState(() => _currentCarouselIndex = entry.key),
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentCarouselIndex == entry.key
                        ? Colors.black54
                        : Colors.grey.shade400,
                  ),
                ),
              );
            }).toList(),
          ),

          // === Top Talents Section ===
          SizedBox(height: 13),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                // SvgPicture.asset('assets/images/googleLogosvg.svg'),
                Image.asset('assets/images/cup.png', width: 20),
                SizedBox(width: 10.0),
                Text('Top Talents', style: GoogleFonts.roboto(fontSize: 16)),
              ],
            ),
          ),
          SizedBox(height: 15),

          //genre filter buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: [
                SizedBox(
                  width: 10,
                ),
                for (int i = 0; i < genresList.length; i++)
                  MyButtons(
                    buttonWidth: 85,
                    buttonHeight: 36,
                    buttonText: genresList[i],
                    buttonBackgroundColor: _selectGenre == i
                        ? AppColors.black
                        : AppColors.neutralLightExtra,
                    buttonTextstyle: GoogleFonts.inter(
                        fontSize: 13,
                        color: _selectGenre == i
                            ? AppColors.background
                            : AppColors.black,
                        fontWeight: FontWeight.w400),
                    onTap: () {
                      setState(() {
                        _selectGenre = i;
                      });
                    },
                  ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),

          //filter display
          SizedBox(
            height: 372,
            // height: MediaQuery.sizeOf(context).height * 0.63,
            child: ListView.builder(
              itemCount: filteredVideos.length,
              itemBuilder: (context, index) {
                final vl = filteredVideos[index];
                return Container(
                  height: 400,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(vl['thumbnail']),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Row(
                      //containing two columns: one for profile side and another for video perfomance metrics
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            //white genre text button
                            Container(
                                height: 32,
                                width: 76,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                    color: AppColors.background,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                      vl['genre'],
                                      style: GoogleFonts.inter(
                                          color: AppColors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
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
                                    backgroundImage:
                                        AssetImage(vl['profilePic']),
                                  ),
                                ),
                                Text(
                                  vl['creator'],
                                  style: GoogleFonts.roboto(
                                      color: AppColors.background,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Iconsax.verify5,
                                  color: Colors.yellow,
                                  size: 17,
                                ),
                                Container(
                                    height: 20,
                                    width: 64,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                    ),
                                    decoration: BoxDecoration(
                                        color: AppColors.transparent,
                                        border: Border.all(
                                            color: AppColors.background,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Center(
                                      child: Text(
                                        "Follow",
                                        style: GoogleFonts.inter(
                                            color: AppColors.background,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 9),
                                      ),
                                    ))
                              ],
                            ),

                            //text widget showing the video name
                            Text(
                              vl['title'],
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
                                  width:
                                      40, // Adjust based on how many avatars and overlap
                                  height: 32, // Avatar diameter (2 * radius)
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 5,
                                        child: CircleAvatar(
                                          radius: 10.0,
                                          backgroundImage: AssetImage(
                                              'assets/images/girl_two.jpg'),
                                        ),
                                      ),
                                      Positioned(
                                        left: 10,
                                        top: 5, // overlapping offset
                                        child: CircleAvatar(
                                          radius: 10.0,
                                          backgroundImage: AssetImage(
                                              'assets/images/girl_three.jpg'),
                                        ),
                                      ),
                                      Positioned(
                                        left: 20,
                                        top: 5,
                                        child: CircleAvatar(
                                          radius: 10.0,
                                          backgroundImage: AssetImage(
                                              'assets/images/girl_four.jpg'),
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

                        //second column for the metrics
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            //icon and number under it
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              spacing: 20,
                              children: [
                                videoMetrics(
                                    theIcon: Icons.favorite_border_outlined,
                                    theText: "66k",
                                    onTap: () {}),
                                videoMetrics(
                                    theIcon: Iconsax.message,
                                    theText: "22k",
                                    onTap: () {
                                      showModalBottomSheet(
                                        useSafeArea: false,
                                        // backgroundColor: AppColors.transparent,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        context: context,
                                        isScrollControlled:
                                            true, // Allows the modal to take full screen
                                        isDismissible:
                                            true, // Enables dismissing by tapping outside
                                        enableDrag:
                                            true, // Enables dragging to close
                                        builder: (context) {
                                          return FractionallySizedBox(
                                            heightFactor:
                                                0.8, // 80% of the screen height
                                            child:
                                                CommentsScreen(), // Replace with your desired widget
                                          );
                                        },
                                      );
                                    }),
                                videoMetrics(
                                    theIcon: Iconsax.document_forward,
                                    theText: "1k",
                                    onTap: () {}),
                                videoMetrics(
                                    theIcon: Iconsax.gift,
                                    theText: "1k",
                                    onTap: () {}),
                                videoMetrics(
                                    theIcon: Icons.bookmark,
                                    theText: "100",
                                    onTap: () {}),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Column videoMetrics(
      {required IconData theIcon,
      required String theText,
      required VoidCallback? onTap}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(
            theIcon,
            color: Colors.white,
            size: 18,
          ),
        ),
        Text(
          theText,
          style: GoogleFonts.inter(color: Colors.white, fontSize: 10),
        )
      ],
    );
  }
}
