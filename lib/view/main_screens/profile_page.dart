import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/view/profile_screens/edit_profile.dart';
import 'package:spotlight/view/manage_competition/mng_comp_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            spacing: 15,
            children: [
              // Profile Header
              Column(
                children: [
                  Text(
                    'Hills Music',
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '@HillsMusic',
                    style: GoogleFonts.inter(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),

              //profile pic and account metrics
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //profile pic
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.neutralLight, // border color
                        width: 2.0, // border width
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: AssetImage('assets/images/guy.png'),
                    ),
                  ),

                  //no of posts
                  profileMetrics(typeNumber: 15, textType: "Posts"),
                  //no of followers
                  profileMetrics(typeNumber: 1000, textType: "Followers"),
                  //no of following
                  profileMetrics(typeNumber: 20, textType: "Following"),
                ],
              ),

              //profile decription
              Text(
                'Where words fail | Music speaks | Music Lover \n I Create Music that Loves the world and into and high level of spirtuality and possibilities.',
                style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),

              //edit and share buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfilePage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xffD9D9D9),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 5.0),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(
                              width: 2,
                              color: Color(0xffD9D9D9),
                            ))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 5.0),
                      child: Text(
                        'Share Profile',
                        style: TextStyle(fontSize: 13.0),
                      ),
                    ),
                  ),
                ],
              ),

              //various tabs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Posts',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    'Ongoing Event',
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ManageCompetitionPage(),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 249, 157, 157),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 5.0),
                  child: Text(
                    'My competitions',
                    style: TextStyle(fontSize: 13.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column profileMetrics(
      {required double typeNumber, required String textType}) {
    return Column(
      children: [
        Text(
          "$typeNumber",
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w700),
        ),
        Text(
          textType,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
