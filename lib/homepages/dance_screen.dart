import 'package:flutter/material.dart';
import 'package:spotlight/components/home_contents_dance.dart';
import '../components/home_contents.dart';

class DanceScreen extends StatefulWidget {
  const DanceScreen({super.key});

  @override
  State<DanceScreen> createState() => _DanceScreenState();
}

class _DanceScreenState extends State<DanceScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 8),
        child: ListView(
          children: [
            HomeContentsDance(
                thumnNailUrl: "assets/images/baby.jpg",
                profPic: "assets/images/eyeguy.jpg",
                profname: "Bisola Adegoke"),
            HomeContentsDance(
                thumnNailUrl: "assets/images/m2.png",
                profPic: "assets/images/girl.jpg",
                profname: "Chinedum Okafor"),
            HomeContentsDance(
                thumnNailUrl: "assets/images/girl.jpg",
                profPic: "assets/images/girl.jpg",
                profname: "Chinedum Okafor"),
            HomeContentsDance(
                thumnNailUrl: "assets/images/m3.png",
                profPic: "assets/images/man2.jpg",
                profname: "Adekunle John"),
            // SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
