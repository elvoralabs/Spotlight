import 'package:flutter/material.dart';
import 'package:spotlight/homepages/dashboard.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.zero,
        ),
      ),
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 120.0,
              margin: EdgeInsets.zero,
              padding: EdgeInsets.only(
                top: 35.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.menu,
                  size: 25.0,
                ),
                title: Text(
                  'Spotlight',
                  style: TextStyle(fontSize: 32.0, fontFamily: 'ReenieBeanie'),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard_outlined),
              title: Text('Dashboard'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DashBoard(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.event_available_rounded),
              title: Text('My Events'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.notifications_none_outlined),
              title: Text('Notification'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Earnings & Monetization'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings & Profile'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}
