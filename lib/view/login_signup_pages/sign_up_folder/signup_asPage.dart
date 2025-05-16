import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_appbar.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:spotlight/components/my_signup_appbar.dart';
import 'package:spotlight/view/login_signup_pages/sign_up_folder/signupTabsPage.dart';

class SignupAsPage extends StatefulWidget {
  const SignupAsPage({super.key});

  @override
  State<SignupAsPage> createState() => _SignupAsPageState();
}

class _SignupAsPageState extends State<SignupAsPage> {
  int? selectIndex = null;

  // @override
  // void initState() {
  //   super.initState();
  //   role = true;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //appbar
              MySignUpAppbar(
                pageText: "Sign up as",
              ),
              const SizedBox(height: 50),

              //choose role text
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text("Choose Your Role",
                      style: GoogleFonts.roboto(
                        fontSize: 17,
                        color: AppColors.neutral,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              //Possible options to sign up as
              signupItem(
                color: selectIndex == 0
                    ? const Color.fromARGB(27, 91, 78, 78)
                    : AppColors.background,
                context,
                icon: selectIndex == 0
                    ? Icons.radio_button_checked_outlined
                    : Icons.radio_button_off_outlined,
                text1: "Talent/Fan",
                text2: "Upload, vote & engage",
                onTap: () {
                  setState(() {
                    selectIndex = 0;
                  });
                },
              ),
              signupItem(
                context,
                color: selectIndex == 1
                    ? const Color.fromARGB(27, 91, 78, 78)
                    : AppColors.background,
                icon: selectIndex == 1
                    ? Icons.radio_button_checked_outlined
                    : Icons.radio_button_off_outlined,
                text1: "Event Organizer",
                text2: "Host Competitions",
                onTap: () {
                  setState(() {
                    selectIndex = 1;
                  });
                },
              ),
              signupItem(
                context,
                color: selectIndex == 2
                    ? const Color.fromARGB(27, 91, 78, 78)
                    : AppColors.background,
                icon: selectIndex == 2
                    ? Icons.radio_button_checked_outlined
                    : Icons.radio_button_off_outlined,
                text1: "Talent Scout",
                text2: "Find & Endorse Talent",
                onTap: () {
                  setState(() {
                    selectIndex = 2;
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              //Sign up button
              MyButtons(
                buttonText: "Next",
                buttonBackgroundColor: selectIndex != null
                    ? AppColors.primary
                    : AppColors.primarylight,
                buttonHeight: 60,
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                buttonTextcolor: selectIndex != null
                    ? AppColors.background
                    : AppColors.neutralLight,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignuptabsPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector signupItem(BuildContext context,
      {required IconData icon,
      required Color color,
      required String text1,
      required String text2,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.neutralLight, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //
                CircleAvatar(
                  radius: 11, // Default radius is 30 if not provided
                  backgroundColor: AppColors.background,
                  child: Icon(
                    icon,
                    color: selectIndex == selectIndex
                        ? AppColors.neutral
                        : AppColors.secondary,
                  ), // Default size is 30 if not provided
                ),

                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      text2,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: AppColors.neutralLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
