import 'package:flutter/material.dart';
import '../components/home_contents.dart';

class ActingScreen extends StatefulWidget {
  const ActingScreen({super.key});

  @override
  State<ActingScreen> createState() => _ActingScreenState();
}

class _ActingScreenState extends State<ActingScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
        child: ListView(
          children: [
            HomeContents(
                thumnNailUrl: "assets/images/m3.png",
                profPic: "assets/images/man2.jpg",
                profname: "Adekunle John"),
            HomeContents(
                thumnNailUrl: "assets/images/m2.png",
                profPic: "assets/images/girl.jpg",
                profname: "Chinedum Okafor"),
            HomeContents(
                thumnNailUrl: "assets/images/girl.jpg",
                profPic: "assets/images/girl.jpg",
                profname: "Chinedum Okafor"),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
