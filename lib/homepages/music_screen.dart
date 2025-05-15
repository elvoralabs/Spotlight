import 'package:flutter/material.dart';

import '../components/home_contents.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: ListView(
        children: [
          HomeContents(
              thumnNailUrl: "assets/images/m1.jpg",
              profPic: "assets/images/girl.jpg",
              profname: "Bisola Adegoke"),
          HomeContents(
              thumnNailUrl: "assets/images/m2.png",
              profPic: "assets/images/girl.jpg",
              profname: "Chinedum Okafor"),
          HomeContents(
              thumnNailUrl: "assets/images/girl.jpg",
              profPic: "assets/images/girl.jpg",
              profname: "Chinedum Okafor"),
          HomeContents(
              thumnNailUrl: "assets/images/m3.png",
              profPic: "assets/images/man2.jpg",
              profname: "Adekunle John"),
          // SizedBox(height: 25),
        ],
      ),
    );
  }
}
