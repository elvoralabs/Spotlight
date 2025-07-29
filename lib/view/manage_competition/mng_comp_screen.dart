import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path/path.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/models/video_list.dart';
import 'package:spotlight/view/manage_competition/mng_control_screen.dart';

class ManageCompetitionPage extends StatefulWidget {
  const ManageCompetitionPage({super.key});

  @override
  State<ManageCompetitionPage> createState() => _ManageCompetitionPageState();
}

class _ManageCompetitionPageState extends State<ManageCompetitionPage> {
  int _selectGenre = 0;
  late final List<String> genresList = ['Music', 'Art', 'Dance', 'Acting'];

  //this is to call the instance of class VideoList from another file
  VideoList videoList = VideoList();

  // Track the selected talent here
  String selectedTalent = 'Music';

  @override
  Widget build(BuildContext context) {
    final filteredVideos = videoList.videos
        .where((video) => video['genre'] == genresList[_selectGenre])
        .toList();

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          children: [
            // Header
            Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.keyboard_arrow_left_rounded),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Manage Competitions',
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            //create comp plus button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: AppColors.primary,
                  child: Icon(
                    Icons.add,
                    size: 25,
                    color: AppColors.background,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),

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

            ...List.generate(filteredVideos.length, (index) {
              final vl = filteredVideos[index];
              return Container(
                  height: 571,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  padding: EdgeInsets.fromLTRB(8, 12, 8, 30),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    spacing: 8,
                    children: [
                      //image container
                      Stack(
                        children: [
                          Container(
                            height: 261,
                            padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(vl['thumbnail']),
                                  fit: BoxFit.cover,
                                ),
                                border:
                                    Border.all(color: Colors.grey, width: 1.0),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  vl['title'],
                                  style: GoogleFonts.inter(
                                      color: AppColors.background,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'N10 Million Cash Prize',
                                  style: GoogleFonts.inter(
                                      color: AppColors.background,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      //title text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Text(
                            'Title:',
                            style: GoogleFonts.inter(
                                color: AppColors.neutral,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            vl['title'],
                            style: GoogleFonts.inter(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),

                      //category badge text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Text(
                            'Category:',
                            style: GoogleFonts.inter(
                                color: AppColors.neutral,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            vl['genre'],
                            style: GoogleFonts.inter(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),

                      //status badge
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Text(
                            'Status Badge:',
                            style: GoogleFonts.inter(
                                color: AppColors.neutral,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Live',
                            style: GoogleFonts.inter(
                                color: Colors.green,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),

                      //entry count text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Text(
                            'Entry Count:',
                            style: GoogleFonts.inter(
                                color: AppColors.neutral,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${index + Random().nextInt(100) + 50}',
                            style: GoogleFonts.inter(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),

                      //total votes text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Text(
                            'Total votes:',
                            style: GoogleFonts.inter(
                                color: AppColors.neutral,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${Random().nextInt(100) + 50}',
                            style: GoogleFonts.inter(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),

                      //time left or date text
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 15,
                        children: [
                          Text(
                            'Time Left or Date:',
                            style: GoogleFonts.inter(
                                color: AppColors.neutral,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            '${index + Random().nextInt(100) + 3}d ${Random().nextInt(10) + 5}h remaining',
                            style: GoogleFonts.inter(
                                fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      //manage button
                      MyButtons(
                        buttonText: 'Manage',
                        buttonWidth: double.infinity,
                        buttonHeight: 48,
                        buttonBackgroundColor: AppColors.black,
                        buttonTextstyle: GoogleFonts.inter(
                            color: AppColors.background,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MngControlScreen(
                                title: vl['title'],
                                thumbnail: vl['thumbnail'],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ));
            }),
          ],
        ),
      )),
    );
  }
}
