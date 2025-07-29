import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/view/manage_competition/edit_comp_page.dart';

class MngControlScreen extends StatefulWidget {
  final String title;
  final String thumbnail;

  const MngControlScreen(
      {super.key, required this.title, required this.thumbnail});

  @override
  State<MngControlScreen> createState() => _MngControlScreenState();
}

class _MngControlScreenState extends State<MngControlScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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

            //image container
            Stack(
              children: [
                Container(
                  height: 261,
                  padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.thumbnail),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
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
            SizedBox(
              height: 20,
            ),

            //title text
            Text(
              'Title',
              style:
                  GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              // controller: textController,
              strutStyle: StrutStyle(),
              decoration: InputDecoration(
                hintText: 'Afro Dance Challenge',
                hintStyle: GoogleFonts.inter(
                    color: AppColors.neutralLight,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: AppColors
                          .neutralLight), // Red border when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2), // Red border when focused
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //organizer name
            Text(
              'Organizer name',
              style:
                  GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              // controller: textController,
              strutStyle: StrutStyle(),
              decoration: InputDecoration(
                hintText: 'Street dance',
                hintStyle: GoogleFonts.inter(
                    color: AppColors.neutralLight,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: AppColors
                          .neutralLight), // Red border when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2), // Red border when focused
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //status badge
            Text(
              'Status Badge',
              style:
                  GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              // controller: textController,
              strutStyle: StrutStyle(),
              decoration: InputDecoration(
                hintText: 'Live',
                hintStyle: GoogleFonts.inter(
                    color: AppColors.neutralLight,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: AppColors
                          .neutralLight), // Red border when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2), // Red border when focused
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //edit button
            MyButtons(
              buttonText: 'Edit',
              buttonWidth: double.infinity,
              buttonHeight: 48,
              buttonBackgroundColor: AppColors.neutralLight,
              buttonTextstyle: GoogleFonts.inter(
                  color: AppColors.background,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditCompScreen(
                      title: widget.title,
                      thumbnail: widget.thumbnail,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 15,
            ),

            //pause button
            MyButtons(
              buttonText: 'Pause',
              buttonWidth: double.infinity,
              buttonHeight: 48,
              buttonBackgroundColor: AppColors.neutralLight,
              buttonTextstyle: GoogleFonts.inter(
                  color: AppColors.background,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MngControlScreen(
                //       title: vl['title'],
                //       thumbnail: vl['thumbnail'],
                //     ),
                //   ),
                // );
              },
            ),
            SizedBox(
              height: 15,
            ),

            //delete button
            MyButtons(
              buttonText: 'Delete',
              buttonWidth: double.infinity,
              buttonHeight: 48,
              buttonBackgroundColor: AppColors.neutralLight,
              buttonTextstyle: GoogleFonts.inter(
                  color: AppColors.background,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MngControlScreen(
                //       title: vl['title'],
                //       thumbnail: vl['thumbnail'],
                //     ),
                //   ),
                // );
              },
            ),
            SizedBox(
              height: 15,
            ),

            //view public button
            MyButtons(
              buttonText: 'View Public',
              buttonWidth: double.infinity,
              buttonHeight: 48,
              buttonBackgroundColor: AppColors.neutralLight,
              buttonTextstyle: GoogleFonts.inter(
                  color: AppColors.background,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MngControlScreen(
                //       title: vl['title'],
                //       thumbnail: vl['thumbnail'],
                //     ),
                //   ),
                // );
              },
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}
