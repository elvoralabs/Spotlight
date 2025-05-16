import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:spotlight/components/my_signup_appbar.dart';
import 'package:spotlight/view/login_signup_pages/sign_up_folder/signup_getspotted.dart';

class SignupFinalpage extends StatefulWidget {
  const SignupFinalpage({super.key});

  @override
  State<SignupFinalpage> createState() => _SignupFinalpageState();
}

class _SignupFinalpageState extends State<SignupFinalpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              spacing: 10,
              children: [
                MySignUpAppbar(
                  pageText: "Sign Up",
                ),
                SizedBox(
                  height: 20,
                ),

                //profile picture
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage('assets/images/man2.jpg'),
                    ),
                    Positioned(
                      bottom: 10, // Position at the bottom
                      right: 10, // Position at the right
                      child: MyCircleButtons(
                        theIcon: Iconsax.edit_2,
                        iconSize: 14,
                        radius: 12,
                        iconColor: AppColors.neutral,
                        backgroundColor: AppColors.background,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),

                //Items
                MyItems(text1: "Full Name", text2: "Enter full name"),
                MyItems(
                    text1: "Gender",
                    text2: "Choose your Gender",
                    sufIcon: Icon(
                      Iconsax.arrow_down_1,
                      color: Colors.black,
                    )),
                MyItems(
                  text1: "Date of Birth",
                  text2: "Enter your date of birth",
                  sufIcon: Icon(Iconsax.calendar),
                ),
                MyItems(
                    text1: "Location: Country", text2: "Choose your country"),
                MyItems(text1: "Location: State", text2: "Choose your state"),
                MyItems(
                  text1: "Create Password",
                  text2: "Enter your password",
                  sufIcon: Icon(Iconsax.eye_slash),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your password must have:",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "> 8 to 20 characters",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Text(
                            "> Letters, numbers and special characters",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                MyItems(
                  text1: "Confirm Password",
                  text2: "Enter your password",
                  sufIcon: Icon(Iconsax.eye_slash),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButtons(
                      buttonText: "Sign Up",
                      buttonBackgroundColor: AppColors.primarylight,
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width * 0.9,
                      buttonTextcolor: AppColors.neutralLight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupGetspotted(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyItems extends StatelessWidget {
  final String text1;
  final String text2;
  final bool? obscureText;
  final Widget? sufIcon;
  const MyItems(
      {super.key,
      required this.text1,
      required this.text2,
      this.obscureText,
      this.sufIcon});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController =
        TextEditingController(); // Default initialization
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Text(
            text1,
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: textController,
            strutStyle: StrutStyle(),
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              hintText: text2,
              hintStyle: TextStyle(fontSize: 15),
              suffixIcon: sufIcon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color:
                        AppColors.neutralLight), // Red border when not focused
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
        ],
      ),
    );
  }
}
