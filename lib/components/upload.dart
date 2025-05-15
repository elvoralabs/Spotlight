import 'package:flutter/material.dart';
import 'package:spotlight/homepages/music_screen.dart';
import 'package:spotlight/homepages/art_screen.dart';
import 'package:spotlight/homepages/dance_screen.dart';
import 'package:spotlight/homepages/acting_screen.dart';

class Upload extends StatefulWidget {
  const Upload(
      {super.key,
      required String selectedTitle,
      required Null Function(String newTitle) onTalentSelected});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  int selectedIndex = 0;

  final List<String> categories = ['Music', 'Art', 'Dance', 'Acting'];

  final List<Widget> screens = [
    MusicScreen(),
    ArtScreen(),
    DanceScreen(),
    ActingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tab Buttons
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            height: 35,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categories.length, (index) {
                bool isSelected = selectedIndex == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      width: 90, // Ensures all containers have the same width
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 9),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.black : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 5),
        // Selected Screen
        screens[selectedIndex],
      ],
    );
  }
}
