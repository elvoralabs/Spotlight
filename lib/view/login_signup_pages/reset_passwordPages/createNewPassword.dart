import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_signup_appbar.dart';
import 'package:spotlight/components/my_textfield.dart';
import 'package:spotlight/view/login_signup_pages/reset_passwordPages/resetPasswordCode.dart';
import 'package:spotlight/view/login_signup_pages/sign_up_folder/signup_finalPage.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
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
                Text("Create new password",
                    style: TextStyle(
                        fontSize: 22,
                        color: AppColors.neutral,
                        fontWeight: FontWeight.bold)),
                Text(
                    "Your new password must be different from previously used password.",
                    style: TextStyle(
                        fontSize: 15,
                        color: AppColors.neutralLight,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 20,
                ),
                Mytextfield(
                  text1: "Create New Password",
                  text2: "Enter new passowrd",
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
                Mytextfield(
                  text1: "Confirm New Password",
                  text2: "Confirm new passowrd",
                  sufIcon: Icon(Iconsax.eye_slash),
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButtons(
                      buttonText: "Reset Password",
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
              ]),
        ),
      ),
    );
  }
}
