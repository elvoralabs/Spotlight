import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_appbar.dart';
import 'package:spotlight/components/my_circlebuttons.dart';

class Notificationspage extends StatefulWidget {
  const Notificationspage({super.key});

  @override
  State<Notificationspage> createState() => _NotificationspageState();
}

class _NotificationspageState extends State<Notificationspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              MyAppbar(pageTitle: "Notifications"),
              Text("System & Event Announcements",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),

              //replace this with a listview.builder later
              notificationItem(
                  text: '"New Feature: Live talent Shows!',
                  dateText: 'June 23',
                  backgroundColor: null),

              notificationItem(
                  text: '"“Upcoming Event: - Register Now”',
                  dateText: 'June 23',
                  backgroundColor: null),
              Divider(
                height: 3,
              ),
              Text("Talent Engagement Alerts",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),

              notificationItem(
                  text: '"Hi Vivian,Nike needs your vote!"',
                  dateText: 'June 23',
                  backgroundColor: Colors.greenAccent),
              notificationItem(
                  text: '"Lukeman started to follow you”',
                  dateText: 'June 23',
                  backgroundColor: Colors.greenAccent),
            ],
          ),
        ),
      ),
    );
  }

  Row notificationItem(
      {required String text,
      required String dateText,
      required Color? backgroundColor}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyCircleButtons(
            theIcon: Iconsax.notification,
            backgroundColor: backgroundColor ?? AppColors.primarylight),
        Text(text,
            style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: AppColors.neutral)),
        Text(dateText,
            style: GoogleFonts.inter(fontSize: 13, color: AppColors.neutral))
      ],
    );
  }
}
