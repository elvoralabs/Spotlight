import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/main.dart';
import 'package:spotlight/view/temp_unknown/camera_page.dart';
import 'package:spotlight/view/create_post_folder/take_picture.dart';
import 'package:spotlight/view/main_screens/create_page.dart';
import 'package:spotlight/view/main_screens/explore_page.dart';
import 'package:spotlight/view/main_screens/inbox_page.dart';
import 'package:spotlight/view/main_screens/profile_page.dart';
import 'package:spotlight/view/main_screens/talent_organizer_home.dart';

class SelectScreen extends StatefulWidget {
  final List<CameraDescription> cameras;
  const SelectScreen({super.key, required this.cameras});

  @override
  State<SelectScreen> createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;

  @override
  void initState() {
    page = [
      TalentOrganizerHome(),
      ExplorePage(),
      // CreatePage(cameras: cameras),
      FutureBuilder<List<CameraDescription>>(
        future: availableCameras(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            final firstCamera = snapshot.data!.first;
            return TakePictureScreen(camera: firstCamera);
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading camera'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      InboxPage(),
      ProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        if (selectedIndex != 0) {
          setState(() {
            selectedIndex = 0; // Go to Home tab
          });
          return false; // Prevent default back action
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: page[selectedIndex],
        bottomNavigationBar: selectedIndex == 2
            ? null
            : BottomNavigationBar(
                showUnselectedLabels: true,
                showSelectedLabels: true,
                currentIndex: selectedIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.background,
                backgroundColor: AppColors
                    .black, // Set to transparent to use the Container's color
                selectedIconTheme: IconThemeData(size: 25),
                unselectedIconTheme: IconThemeData(size: 21),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.explore),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.add_square),
                    label: 'Create',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.direct_inbox),
                    label: 'Inbox',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.user),
                    label: 'Profile',
                  ),
                ],
                onTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
      ),
    );
  }
}
