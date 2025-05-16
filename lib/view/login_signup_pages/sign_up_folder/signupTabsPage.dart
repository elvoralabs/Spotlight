import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_signup_appbar.dart';
import 'package:spotlight/view/login_signup_pages/sign_up_folder/signup_enterCodepage.dart';

class SignuptabsPage extends StatefulWidget {
  const SignuptabsPage({super.key});

  @override
  State<SignuptabsPage> createState() => _SignuptabsPageState();
}

class _SignuptabsPageState extends State<SignuptabsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MySignUpAppbar(
                pageText: "Sign Up",
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: TabSection(),
              ), // Embedding the tab section inside the page
            ],
          ),
        ),
      ),
    );
  }
}

class TabSection extends StatefulWidget {
  @override
  _TabSectionState createState() => _TabSectionState();
}

class _TabSectionState extends State<TabSection>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController numberController = TextEditingController();

  bool sendEmail = false;

  @override
  void initState() {
    super.initState();
    sendEmail = true;
    numberController.addListener(() {
      setState(() {});
    });
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          labelColor: Colors.black,
          unselectedLabelColor: AppColors.neutral,
          tabs: [
            Tab(text: 'Phone'),
            Tab(text: 'Email'),
          ],
        ),
        SizedBox(
          height: 400, // Adjust the height as needed
          child: TabBarView(
            controller: _tabController,
            children: [
              phoneTab(),
              emailTab(),
            ],
          ),
        ),
      ],
    );
  }

  Column phoneTab() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
                "Enter your phone number, we'll send you a code for verification",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.neutral,
                )),
            TextField(
                controller: numberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'NGN +234 | Phone Number',
                )),
            Text(
                "By signing up, you agree to our Terms & Conditions, acknowledge our Privacy Policy, and confirm that you’re over 18. We may send promotions related to our services - you can unsubscribe anytime in communication Settings under your Profile.",
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.neutral,
                )),
            SizedBox(
              height: 20,
            ),
            MyButtons(
              buttonText: "Send Code",
              buttonBackgroundColor: numberController.text.isEmpty
                  ? AppColors.primarylight
                  : AppColors.primary,
              buttonHeight: 60,
              buttonWidth: MediaQuery.of(context).size.width * 0.9,
              buttonTextcolor: numberController.text.isEmpty
                  ? AppColors.neutralLight
                  : AppColors.background,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupEntercodepage(),
                  ),
                );
              },
            ),
          ]);

  SingleChildScrollView emailTab() => SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                  "Enter your email address, we'll send you a code for verification",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.neutral,
                  )),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                  )),
              Text(
                  "By signing up, you agree to our Terms & Conditions, acknowledge our Privacy Policy, and confirm that you’re over 18. We may send promotions related to our services - you can unsubscribe anytime in communication Settings under your Profile.",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.neutral,
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                spacing: 5,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          sendEmail = !sendEmail;
                        });
                      },
                      icon: Icon(
                          sendEmail
                              ? Iconsax.tick_square
                              : Icons.crop_square_rounded,
                          size: 20)),
                  Expanded(
                    child: Text(
                        "Enter your email address, we'll send you a code for verification",
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.neutral,
                        )),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              MyButtons(
                buttonText: "Send Code",
                buttonBackgroundColor: AppColors.primarylight,
                buttonHeight: 60,
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                buttonTextcolor: AppColors.neutralLight,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupEntercodepage(),
                    ),
                  );
                },
              ),
            ]),
      );
}
