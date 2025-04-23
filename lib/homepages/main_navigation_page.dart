import 'package:flutter/material.dart';
import 'package:spotlight/homepages/profile_page.dart';
import 'package:spotlight/homepages/talent_organizer_home.dart';

import 'create_page.dart';
import 'inbox_page.dart';

class MainNavigationPage extends StatefulWidget {
  @override
  _MainNavigationPageState createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  // List of screens
  final List<Widget> _screens = [
    TalentOrganizerHome(),
    CreatePage(),
    InboxPage(),
    ProfilePage(),
    // MenuScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Display selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Color(0xff212121),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xffEA1E61),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: 'Create'),
          BottomNavigationBarItem(
              icon: Icon(Icons.inbox_outlined), label: 'Inbox'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }
}
