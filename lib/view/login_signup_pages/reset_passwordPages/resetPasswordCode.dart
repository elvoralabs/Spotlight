import 'package:flutter/material.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_signup_appbar.dart';
import 'package:spotlight/view/login_signup_pages/reset_passwordPages/createNewPassword.dart';
import 'package:spotlight/view/login_signup_pages/sign_up_folder/signup_finalPage.dart';

class ResetPassCode extends StatefulWidget {
  const ResetPassCode({super.key});

  @override
  State<ResetPassCode> createState() => _ResetPassCodeState();
}

class _ResetPassCodeState extends State<ResetPassCode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                MySignUpAppbar(pageText: " "),
                Text("Enter 6-digit code",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Text("Please enter the code sent to your mail.",
                    style: TextStyle(
                        fontSize: 13,
                        color: AppColors.neutralLight,
                        fontWeight: FontWeight.bold)),
                TextField(
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: '',
                    )),
                Text("Resend code",
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.neutral,
                    )),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButtons(
                      buttonText: "Verify",
                      buttonBackgroundColor: AppColors.primarylight,
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width * 0.9,
                      buttonTextcolor: AppColors.neutralLight,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreateNewPassword(),
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
