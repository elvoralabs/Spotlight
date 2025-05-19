import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_appbar.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:spotlight/components/my_signup_appbar.dart';
import 'package:spotlight/view/profile%20screens/help_supportPage.dart';
import 'package:spotlight/view/profile%20screens/report_block_page.dart';
import 'package:spotlight/view/profile%20screens/security_settingsPage.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            spacing: 20,
            children: [
              //appbar
              MyAppbar(pageTitle: "Edit Profile"),

              //row of profile pic adn profile details
              Row(
                spacing: 30,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.neutralLight, // border color
                            width: 2.0, // border width
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage('assets/images/guy.png'),
                        ),
                      ),
                      Positioned(
                          bottom: 5,
                          right: 0,
                          left: 50,
                          child: Icon(
                            Iconsax.verify5,
                            color: AppColors.textPrimary,
                          )),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                ],
              ),

              //horizontal lines
              Divider(
                height: 3,
              ),

              //list of edit profile items
              editProfileItem(
                  itemIcon: Iconsax.setting_2,
                  itemText: "Account Settings",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecuritySettingspage(),
                      ),
                    );
                  }),
              editProfileItem(
                  itemIcon: Iconsax.security_user,
                  itemText: "Security Settings",
                  onTap: () {}),
              editProfileItem(
                  itemIcon: Iconsax.info_circle,
                  itemText: "Report & Block Users",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Report_BlockPage(),
                      ),
                    );
                  }),
              editProfileItem(
                  itemIcon: Icons.support_agent,
                  itemText: "Help & Support",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpSupportpage(),
                      ),
                    );
                  }),

              //horizontal lines
              Divider(
                height: 3,
              ),

              Container(
                width: double.infinity,
                height: 70,
                decoration: BoxDecoration(color: AppColors.primary),
                child: Row(
                  spacing: 10,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    MyCircleButtons(
                        theIcon: Iconsax.logout_1,
                        backgroundColor: AppColors.background),
                    Text(
                      "Logout",
                      style: GoogleFonts.inter(
                          color: AppColors.background,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ListTile editProfileItem(
      {required IconData itemIcon,
      required String itemText,
      required GestureTapCallback onTap}) {
    return ListTile(
      leading: MyCircleButtons(
          theIcon: itemIcon,
          iconColor: AppColors.black,
          backgroundColor: AppColors.neutralLightExtra),
      title: Text(itemText),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
    );
  }
}
