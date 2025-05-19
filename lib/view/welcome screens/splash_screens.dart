import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/view/welcome%20screens/transition_screens.dart';

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoTransition();
  }

  void _startAutoTransition() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      } else {
        _timer.cancel();
        // Navigate to the next screen after the last page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TransitionScreens(),
          ),
        );
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
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _currentPage = index;
        });
      },
      children: [
        //spalsh screen 1
        Container(
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Spotlight',
                    style: GoogleFonts.reenieBeanie(
                        fontSize: 96,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black),
                  ),
                ),
              ),
              Text("Ready to shine?",
                  style: GoogleFonts.montserrat(
                      decoration: TextDecoration.none,
                      fontSize: 10,
                      color: AppColors.black)),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
        //splash screen 2
        Container(
          color: AppColors.black,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Spotlight',
                    style: GoogleFonts.reenieBeanie(
                        fontSize: 96,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500,
                        color: AppColors.background),
                  ),
                ),
              ),
              Text("Join Spotlight today and start your journey to fame!",
                  style: GoogleFonts.montserrat(
                      fontSize: 10,
                      decoration: TextDecoration.none,
                      color: AppColors.background)),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
        //splash screen 3
        Container(
          color: AppColors.primary,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Spotlight',
                    style: GoogleFonts.reenieBeanie(
                        fontSize: 96,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.w500,
                        color: AppColors.background),
                  ),
                ),
              ),
              Text("Let's go!",
                  style: GoogleFonts.montserrat(
                      fontSize: 10,
                      decoration: TextDecoration.none,
                      color: AppColors.background)),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ],
    );
  }
}
