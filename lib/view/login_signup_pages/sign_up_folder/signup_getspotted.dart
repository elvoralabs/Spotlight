import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/earnings_folder/earn_pagemain.dart';
import 'package:spotlight/view/homepages/talent_organizer_home.dart';
import 'package:spotlight/view/homepages/select_screen.dart';

class SignupGetspotted extends StatefulWidget {
  const SignupGetspotted({super.key});

  @override
  State<SignupGetspotted> createState() => _SignupGetspottedState();
}

class _SignupGetspottedState extends State<SignupGetspotted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/getspottedimages.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      "Congratulations! your account has\nbeen created successfully 🎉🎉",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        // fontWeight: FontWeight.bold,
                      )),
                  Spacer(),
                  MyButtons(
                    buttonText: "Get Spotted",
                    buttonBackgroundColor: AppColors.primary,
                    buttonHeight: 60,
                    buttonWidth: MediaQuery.of(context).size.width * 0.9,
                    buttonTextcolor: AppColors.background,
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => EarnPagemain(),
                      //   ),
                      // );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
