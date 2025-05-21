import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_appbar.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:spotlight/components/my_signup_appbar.dart';
import 'package:spotlight/components/my_textfield.dart';
import 'package:spotlight/view/profile_screens/security_settingsPage.dart';

class Report_BlockPage extends StatefulWidget {
  const Report_BlockPage({super.key});

  @override
  State<Report_BlockPage> createState() => _Report_BlockPageState();
}

class _Report_BlockPageState extends State<Report_BlockPage> {
  String? selectReason;

  final List<String> categories = [
    'Inappropriate Content',
    'Too violent',
    'Copy right issues',
    'Fradulent',
  ];
  @override
  void initState() {
    super.initState();
    selectReason = categories[0]; // Show 'Music' by default
  }

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
              //appbar
              MyAppbar(pageTitle: "Report & Block Users"),

              Text("Report User",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black)),

              Mytextfield(text1: "User Name", text2: "@vivianhudy"),

              //dropdown selectReason
              Text("Select Reason",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black)),
              DropdownButtonFormField<String>(
                value: selectReason,
                items: categories.map((item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: GoogleFonts.inter(fontSize: 15),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectReason = value;
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.neutralLight),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: AppColors.neutralLight, width: 1),
                  ),
                ),
              ),

              //submit report button
              MyButtons(
                buttonText: "Submit Report",
                buttonBackgroundColor: AppColors.primary,
                buttonTextstyle: GoogleFonts.inter(
                    color: AppColors.background, fontSize: 17),
                buttonHeight: 50,
                buttonWidth: double.infinity,
                // buttonTextcolor: AppColors.background,
                onTap: () {},
              ),

              SizedBox(
                height: 20,
              ),

              Divider(
                height: 3,
              ),
              SizedBox(
                height: 20,
              ),
              Text("Blocked Users List",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      color: AppColors.black,
                      fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Blocked User:",
                      style: GoogleFonts.inter(
                          fontSize: 15, color: AppColors.black)),
                  Text("@troublemaker99",
                      style: GoogleFonts.inter(
                          fontSize: 13, color: AppColors.black)),
                ],
              ),
              //unblock button
              MyButtons(
                buttonText: "Unblock",
                buttonBackgroundColor: AppColors.primary,
                buttonTextstyle: GoogleFonts.inter(
                    color: AppColors.background, fontSize: 17),
                buttonHeight: 50,
                buttonWidth: double.infinity,
                // buttonTextcolor: AppColors.background,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile editProfileItem(
      {required IconData itemIcon,
      required String itemText,
      required GestureTapCallback onTap}) {
    return ListTile(
      leading: MyCircleButtons(
          theIcon: itemIcon,
          iconColor: AppColors.black,
          backgroundColor: AppColors.neutralLightExtra),
      title: Text(itemText),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: onTap,
    );
  }
}
