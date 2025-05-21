import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_appbar.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:spotlight/models/notification_model_folder/notification_service.dart';
import 'package:spotlight/models/video_list.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  //this is to call the instance of class VideoList from another file
  VideoList videoList = VideoList();

  int _selectNotifyType = 0;
  late final List<String> notifyList = [
    'All',
    'People you follow',
    'Likes',
    'Comments'
  ];

  @override
  Widget build(BuildContext context) {
    final notifications = NotificationService().notifications;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.keyboard_arrow_left_rounded, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Notifications',
            style:
                GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: [
                SizedBox(
                  width: 10,
                ),
                for (int i = 0; i < notifyList.length; i++)
                  MyButtons(
                    buttonWidth: 125,
                    buttonHeight: 36,
                    buttonText: notifyList[i],
                    buttonBackgroundColor: _selectNotifyType == i
                        ? AppColors.black
                        : AppColors.neutralLightExtra,
                    buttonTextstyle: GoogleFonts.inter(
                        fontSize: 13,
                        color: _selectNotifyType == i
                            ? AppColors.background
                            : AppColors.neutralLight,
                        fontWeight: FontWeight.w400),
                    onTap: () {
                      setState(() {
                        _selectNotifyType = i;
                      });
                    },
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 5),
            child: Text("New",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black)),
          ),
          if (notifications.isEmpty)
            Center(child: Text('No notifications yet.'))
          else
            Expanded(
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final vl = videoList.videos[index];
                  final notif = notifications[index];
                  return ListTile(
                    leading: vl['profilePic'] != null
                        ? CircleAvatar(
                            backgroundImage: AssetImage(vl['profilePic']),
                            radius: 16.5,
                          )
                        : null,
                    title: Text(
                      notif.message,
                      style: GoogleFonts.inter(fontSize: 14),
                    ),
                    subtitle: Text(
                      '${notif.timestamp.hour}:${notif.timestamp.minute}',
                      style: GoogleFonts.inter(fontSize: 10),
                    ),
                    trailing: vl['thumbnail'] != null
                        ? Image.asset(
                            vl['thumbnail'],
                            height: 33,
                            width: 33,
                          )
                        : null,
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
