import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/homepages/music_screen.dart';
import '../components/upload.dart';

class TalentOrganizerHome extends StatefulWidget {
  const TalentOrganizerHome({super.key});

  @override
  State<TalentOrganizerHome> createState() => _TalentOrganizerHomeState();
}

class _TalentOrganizerHomeState extends State<TalentOrganizerHome> {
  int _currentIndex = 0;

  // Track the selected talent here
  String selectedTalent = 'Music';

  final List<String> carouselImgList = [
    'assets/images/bab.png',
    'assets/images/bab.png',
    'assets/images/bab.png',
  ];

  // Map talent to screen widget
  // Widget getSelectedScreen() {
  //   switch (selectedTalent) {
  //     case 'Art':
  //       return Center(child: Text('Art Screen')); // Replace with ArtScreen()
  //     case 'Dance':
  //       return Center(
  //           child: Text('Dance Screen')); // Replace with DanceScreen()
  //     case 'Acting':
  //       return Center(
  //           child: Text('Acting Screen')); // Replace with FashionScreen()
  //     default:
  //       return MusicScreen(); // Default is Music
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Text(
          'Spotlight',
          style: GoogleFonts.reenieBeanie(fontSize: 35),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Row(
              children: [
                Icon(Iconsax.notification),
                SizedBox(width: 40.0),
                Icon(Icons.search, size: 35.0),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            child: Row(
              children: [
                Image.asset('assets/images/emoji.png', width: 20),
                SizedBox(width: 10.0),
                Text('Featured Competitions', style: TextStyle(fontSize: 17)),
              ],
            ),
          ),
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
              height: 170.0,
              viewportFraction: 1.0,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() => _currentIndex = index);
              },
            ),
          ),

          // === Carousel Dots ===
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: carouselImgList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => setState(() => _currentIndex = entry.key),
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

          // === Top Talents Section ===
          SizedBox(height: 13),
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
          SizedBox(height: 15),

          Upload(
            selectedTitle: selectedTalent,
            onTalentSelected: (String newTitle) {
              setState(() => selectedTalent = newTitle);
            },
          ),

          // SizedBox(height: 20),
          //
          // getSelectedScreen(),
          // SizedBox(height: 20),
        ],
      ),
    );
  }
}
