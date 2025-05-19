import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:spotlight/components/my_textfield.dart';
import 'package:spotlight/view/login_signup_pages/reset_passwordPages/resetPasswordPage.dart';
import 'package:spotlight/view/main_screens/select_screen.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //top 2 help and cancel buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyCircleButtons(
                      theIcon: Icons.help_outline_rounded,
                      backgroundColor: AppColors.transparent,
                      iconColor: AppColors.neutral,
                      iconSize: 30,
                    ),
                    // Icon(Iconsax.slash),
                    MyCircleButtons(
                      theIcon: Icons.close,
                      backgroundColor: AppColors.transparent,
                      iconColor: AppColors.neutral,
                      iconSize: 30,
                    ),
                  ],
                ),

                //2 rows of text widgets
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Log in to ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Spotlight",
                        style: GoogleFonts.reenieBeanie(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary)),
                  ],
                ),

                const SizedBox(height: 20),
                Column(
                  children: [
                    Text("🚀 Ready to Shine?",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.neutral,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        "Create a profile, manage your account, make your videos, and more.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.neutral,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
                const SizedBox(height: 25),
                Mytextfield(
                    text1: "Enter Login Details",
                    text2: "Use phone number/email/username"),
                Mytextfield(
                  text1: "Password",
                  text2: "Enter your password",
                  obscureText: true,
                  sufIcon: Icon(Iconsax.eye_slash),
                ),

                //forget password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResetPasswordPage(),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot Password",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),

                MyButtons(
                  buttonText: "Login",
                  buttonHeight: 50,
                  buttonBackgroundColor: AppColors.primary,
                  buttonTextcolor: AppColors.background,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectScreen(),
                      ),
                    );
                  },
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("-----------Or---------"),
                    ],
                  ),
                ),

                //Possible options to sign up with
                loginItem(
                  context,
                  typeIcon: Icon(
                    Icons.facebook,
                    color: AppColors.textPrimary,
                  ),
                  typeText: "Continue with Facebook",
                  onTap: () {
                    // Handle microphone signup
                  },
                ),
                loginItem(
                  context,
                  typeIcon: CircleAvatar(
                    backgroundColor: AppColors.transparent,
                    radius: 12,
                    backgroundImage:
                        AssetImage("assets/images/google logo.png"),
                  ),
                  typeText: "Continue with Google",
                  onTap: () {
                    // Handle microphone signup
                  },
                ),
                loginItem(
                  context,
                  typeIcon: Icon(Icons.apple),
                  typeText: "Continue with Apple",
                  onTap: () {
                    // Handle microphone signup
                  },
                ),
                //terms and conditions aspect
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("By signing up, you agree to our ",
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.neutral,
                          fontWeight: FontWeight.bold,
                        )),
                    Text("Our Terms and Conditions,",
                        style: TextStyle(
                            fontSize: 13,
                            color: AppColors.primary,
                            // color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                  ],
                ),
                Text(
                    "acknowledge our Privacy Policy, and confirm that you’re over 18. We may send promotions related to our services - you can unsubscribe anytime in communication Settings under your Profile.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.neutral,
                      fontWeight: FontWeight.bold,
                    )),

                SizedBox(
                  height: 20,
                ),
                //Already have an account? text
                Container(
                  height: 50,
                  decoration: BoxDecoration(color: AppColors.primarylight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: TextStyle(
                            fontSize: 15,
                            // color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          )),
                      TextButton(
                        onPressed: () {},
                        child: Text("Sign up",
                            style: TextStyle(
                              fontSize: 15,
                              color: AppColors.primary,
                              // color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector loginItem(BuildContext context,
      {required Widget typeIcon,
      required String typeText,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.neutral, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                CircleAvatar(
                  radius: 20, // Default radius is 30 if not provided
                  backgroundColor: AppColors.background,
                  child: typeIcon, // Default size is 30 if not provided
                ),
                SizedBox(width: 45),
                Expanded(
                  child: Text(
                    typeText,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                ),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
