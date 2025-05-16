import 'package:flutter/material.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_signup_appbar.dart';
import 'package:spotlight/view/login_signup_pages/sign_up_folder/signup_finalPage.dart';

class SignupEntercodepage extends StatefulWidget {
  const SignupEntercodepage({super.key});

  @override
  State<SignupEntercodepage> createState() => _SignupEntercodepageState();
}

class _SignupEntercodepageState extends State<SignupEntercodepage> {
  TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    codeController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                MySignUpAppbar(
                  pageText: "Sign Up",
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Enter 6-digit code",
                          style: TextStyle(
                              fontSize: 22,
                              color: AppColors.neutral,
                              fontWeight: FontWeight.bold)),
                      Text("Your code was sent to +234 812345678",
                          style: TextStyle(
                              fontSize: 13,
                              color: AppColors.neutralLight,
                              fontWeight: FontWeight.bold)),
                      TextField(
                          keyboardType: TextInputType.number,
                          controller: codeController,
                          decoration: InputDecoration(
                            labelText: '',
                          )),
                      Text("Resend code in 54s.",
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
                            buttonText: "Sign Up",
                            buttonBackgroundColor: codeController.text.isEmpty
                                ? AppColors.primarylight
                                : AppColors.primary,
                            buttonHeight: 60,
                            buttonWidth:
                                MediaQuery.of(context).size.width * 0.9,
                            buttonTextcolor: codeController.text.isEmpty
                                ? AppColors.neutralLight
                                : AppColors.background,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignupFinalpage(),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
