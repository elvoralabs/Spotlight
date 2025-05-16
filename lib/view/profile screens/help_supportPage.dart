import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_appbar.dart';

class HelpSupportpage extends StatefulWidget {
  const HelpSupportpage({super.key});

  @override
  State<HelpSupportpage> createState() => _HelpSupportpageState();
}

class _HelpSupportpageState extends State<HelpSupportpage> {
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
              MyAppbar(pageTitle: "Help & Support"),
              Text("FAQs & Support Center",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black)),
              GestureDetector(
                onTap: () {},
                child: Text(
                  '(Read common issues and solutions.)',
                  style: GoogleFonts.inter(
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff3B82F6),
                    fontSize: 15,
                    color: Color(0xff3B82F6),
                  ),
                ),
              ),
              Divider(
                height: 3,
              ),
              Text("Contact Support",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black)),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Elvolarlabs@gmail.com',
                  style: GoogleFonts.inter(
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff3B82F6),
                    fontSize: 15,
                    color: Color(0xff3B82F6),
                  ),
                ),
              ),
              Divider(
                height: 3,
              ),
              Text("Terms & Privacy Policy",
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black)),
              GestureDetector(
                onTap: () {},
                child: Text(
                  '(Read platform rules and data policies.)',
                  style: GoogleFonts.inter(
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff3B82F6),
                    fontSize: 15,
                    color: Color(0xff3B82F6),
                  ),
                ),
              ),
              Divider(
                height: 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
