import 'package:flutter/material.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_signup_appbar.dart';
import 'package:spotlight/components/my_textfield.dart';
import 'package:spotlight/login_signup_pages/reset_passwordPages/resetPasswordCode.dart';
import 'package:spotlight/login_signup_pages/sign_up_folder/signup_finalPage.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                MySignUpAppbar(pageText: " "),
                Text("Reset Password",
                    style: TextStyle(
                        fontSize: 22,
                        color: AppColors.neutral,
                        fontWeight: FontWeight.bold)),
                Text(
                    "Enter the email associated with your account and we’ll send an email with instructions to reset your password.",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.neutralLight,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Mytextfield(
                    text1: "Enter email address",
                    text2: "Enter your email address"),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButtons(
                      buttonText: "Send Instructions",
                      buttonBackgroundColor: AppColors.primarylight,
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width * 0.9,
                      buttonTextcolor: AppColors.neutralLight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPassCode(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "------------------------------Or------------------------------"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        "Try another way using phone number",
                        style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
