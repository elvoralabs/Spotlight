import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_appbar.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_circlebuttons.dart';

class SecuritySettingspage extends StatefulWidget {
  const SecuritySettingspage({super.key});

  @override
  State<SecuritySettingspage> createState() => _SecuritySettingspageState();
}

class _SecuritySettingspageState extends State<SecuritySettingspage> {
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
              MyAppbar(pageTitle: "Security Settings"),

              Text("Two-Factor Authentication",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black)),

              //list of edit profile items
              editProfileItem(
                itemText: "SMS Code",
                widget: GestureDetector(
                  child: Icon(
                    Icons.toggle_off,
                    size: 30,
                    color: Colors.green,
                  ),
                ),
              ),
              editProfileItem(
                itemText: "Authenticator App",
                widget: GestureDetector(
                  child: Icon(
                    Icons.toggle_off,
                    size: 30,
                    color: Colors.green,
                  ),
                ),
              ),

              MyButtons(
                buttonWidth: double.infinity,
                buttonHeight: 50,
                buttonText: "Enable",
                buttonTextstyle: GoogleFonts.inter(
                    color: AppColors.background, fontSize: 17),
                buttonBackgroundColor: AppColors.primary,
                // buttonTextcolor: AppColors.background,
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
              Text("Login Activity",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black)),

              //list of edit profile items
              editProfileItem(
                itemText: "Current Device:",
                widget: Text("iphone14 - Lagos, nigeria (Active)",
                    style: GoogleFonts.inter(
                        fontSize: 13, color: AppColors.neutralLight)),
              ),
              editProfileItem(
                itemText: "Last Login:",
                widget: Text("Macbook Pro - Lagos, nigeria (Active)",
                    style: GoogleFonts.inter(
                        fontSize: 13, color: AppColors.neutralLight)),
              ),

              MyButtons(
                buttonWidth: double.infinity,
                buttonHeight: 50,
                buttonText: "Sign Out of All Devices",
                buttonTextstyle: GoogleFonts.inter(
                    color: AppColors.background, fontSize: 17),
                buttonBackgroundColor: AppColors.primary,
                // buttonTextcolor: AppColors.background,
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
              Text("Privacy Settings",
                  style: GoogleFonts.inter(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black)),

              //list of edit profile items
              editProfileItem(
                itemText: "Who can see my profile?",
                widget: Text("public - everyone",
                    style: GoogleFonts.inter(
                        fontSize: 13, color: AppColors.neutralLight)),
              ),
              editProfileItem(
                itemText: "Who can message me?:",
                widget: Text("private - followers only",
                    style: GoogleFonts.inter(
                        fontSize: 13, color: AppColors.neutralLight)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row editProfileItem({
    required String itemText,
    required Widget? widget,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(itemText,
            style: GoogleFonts.inter(fontSize: 15, color: AppColors.black)),
        widget ??
            Icon(
              Icons.toggle_off,
              size: 30,
              color: Colors.green,
            ),
      ],
    );
  }
}
