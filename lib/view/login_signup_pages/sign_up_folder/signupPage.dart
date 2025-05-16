import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_appbar.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:spotlight/view/login_signup_pages/login_folder/loginPage.dart';
import 'package:spotlight/view/login_signup_pages/sign_up_folder/signup_asPage.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
                  Text("Sign up for ",
                      style: TextStyle(
                        fontSize: 20,
                        // color: AppColors.textPrimary,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Join ",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.neutral,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Spotlight ",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("today and start your journey to fame!",
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.neutral,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),

              //Possible options to sign up with
              signupItem(
                context,
                typeIcon: Icon(Icons.person),
                typeText: "Use phone or email",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupAsPage(),
                    ),
                  );
                  // Handle microphone signup
                },
              ),
              signupItem(
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
              signupItem(
                context,
                typeIcon: CircleAvatar(
                  backgroundColor: AppColors.transparent,
                  radius: 12,
                  backgroundImage: AssetImage("assets/images/google logo.png"),
                ),
                typeText: "Continue with Google",
                onTap: () {
                  // Handle microphone signup
                },
              ),
              signupItem(
                context,
                typeIcon: Icon(Icons.apple),
                typeText: "Continue with Apple",
                onTap: () {
                  // Handle microphone signup
                },
              ),

              Spacer(),
              //terms and conditions aspect
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("By signing up, you agree to our ",
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.neutralLight,
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
                    color: AppColors.neutralLight,
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
                    Text("Already have an account?",
                        style: TextStyle(
                          fontSize: 15,
                          // color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        )),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginpage(),
                          ),
                        );
                      },
                      child: Text("Log in",
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
    );
  }

  GestureDetector signupItem(BuildContext context,
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
            border: Border.all(color: AppColors.neutralLight, width: 1),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
