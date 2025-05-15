import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'dart:async';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:spotlight/login_signup_pages/login_folder/loginPage.dart';
import 'package:spotlight/login_signup_pages/sign_up_folder/signupPage.dart';

class TransitionScreens extends StatefulWidget {
  const TransitionScreens({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TransitionScreensState createState() => _TransitionScreensState();
}

class _TransitionScreensState extends State<TransitionScreens> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoTransition();
  }

  void _startAutoTransition() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < 4) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _timer.cancel();
        // Navigate to the next screen after the last page
        Navigator.pushReplacementNamed(context, '/home');
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                _buildPage(context,
                    text1: "📢 Unleash Your Talent, Shine Bright!",
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome to ",
                            style: TextStyle(
                              fontSize: 20,
                              // color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("Spotlight!",
                            style: GoogleFonts.reenieBeanie(
                              fontSize: 30,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    imagePath: "assets/images/p1.jpeg"),
                _buildPage(context,
                    text1: "🏆 Join Talent Competitions & Win Big!",
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Showcase Your ",
                                style: TextStyle(
                                  fontSize: 20,
                                  // color: AppColors.textPrimary,
                                  fontWeight: FontWeight.bold,
                                )),
                            Text("Skills,",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        Text("Compete And Get Recognized",
                            style: TextStyle(
                              fontSize: 20,
                              // color: AppColors.textPrimary,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    imagePath: "assets/images/p2.jpeg"),
                _buildPage(
                  context,
                  text1: "❤️ Be the Judge, Make an Impact!",
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Vote ",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              )),
                          Text("&",
                              style: TextStyle(
                                fontSize: 20,
                                // color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(" Support",
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.primary,
                                fontWeight: FontWeight.bold,
                              )),
                          Text(" Your Favorites",
                              style: TextStyle(
                                fontSize: 20,
                                // color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      Text("Talent",
                          style: TextStyle(
                            fontSize: 20,
                            // color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  imagePath: "assets/images/p3.jpeg",
                ),
                _buildPage(
                  context,
                  text1: "🤝 Turn Your Passion into a Career!",
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Connect With ",
                          style: TextStyle(
                            fontSize: 20,
                            // color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Scouts",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          )),
                      Text(" & ",
                          style: TextStyle(
                            fontSize: 20,
                            // color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Organizers",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  imagePath: "assets/images/p4.jpeg",
                ),
                _buildPage(context,
                    text1: "💼 Unlock Sponsorships & Exclusive Deals!",
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Get ",
                            style: TextStyle(
                              fontSize: 20,
                              // color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("Sponsored",
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            )),
                        Text(" & Grow Your Brand",
                            style: TextStyle(
                              fontSize: 20,
                              // color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            )),
                      ],
                    ),
                    imagePath: "assets/images/p5.jpeg"),
              ],
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  // LinearProgressIndicator(
                  //   value: (_currentPage + 1) / 5, // Progress based on the page
                  //   backgroundColor: Colors.grey[300],
                  //   valueColor:
                  //       const AlwaysStoppedAnimation<Color>(Colors.black),
                  // ),
                  // const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      5,
                      (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 60,
                        height: 5,
                        decoration: BoxDecoration(
                          color: _currentPage == index
                              ? Colors.black
                              : Colors.white54,
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignupPage(),
                              ),
                            );
                          },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                                color: AppColors.background,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context,
      {required String text1,
      Widget? widget,
      required String imagePath,
      bool isLastPage = false}) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //first text which are small sized
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text1,
                    style: GoogleFonts.inter(
                        fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              //horizontal decoration line
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Divider(
                  thickness: 1, // Adjust the thickness of the line
                  color: Colors.grey, // Set the color of the line
                ),
              ),
              const SizedBox(height: 40),
              //bigger text above the buttons
              if (widget != null) widget,
              const SizedBox(height: 20),
              MyButtons(
                buttonText: "Next",
                buttonBackgroundColor: AppColors.primary,
                buttonTextcolor: AppColors.background,
                buttonWidth: MediaQuery.of(context).size.width * 0.9,
                buttonHeight: 50,
                // onTap: () {
                //   setState((BuildContext) {
                //     _currentPage == index(context);
                //   });
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SignupPage(),
                //   ),
                // );
                // },
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => SignupPage(),
                //     ),
                //   );
                // },
                // onPageChanged: (index) {
                //   setState(() {
                //     _currentPage = index;
                //   });
                // },
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
