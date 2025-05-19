import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_textfield.dart';

class Tab1 extends StatelessWidget {
  const Tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
                color: AppColors.background,
                border: Border.all(color: AppColors.neutralLight),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Text(
                  "Top Earning Event",
                  style: GoogleFonts.inter(),
                ),
                Text(
                  "Naija Voice 2025",
                  style: GoogleFonts.dmSerifDisplay(fontSize: 25),
                )
              ],
            ),
          ),
          amountCont(text: "Total Earnings", amount: 200000),
          amountCont(text: "Today's Earning", amount: 14000),
          Text(
            "Earnings Breakdown",
            style: GoogleFonts.inter(),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            decoration: BoxDecoration(
                color: AppColors.background,
                border: Border.all(color: AppColors.neutralLight),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                    decoration: BoxDecoration(
                        color: Colors.greenAccent.shade100,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      "Paid Votes",
                      style: GoogleFonts.inter(color: Colors.green.shade600),
                    )),
                Text(
                  "Street Dance Battle",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total Votes:",
                      style: GoogleFonts.inter(color: AppColors.neutralLight),
                    ),
                    Text(
                      "4030",
                      style: GoogleFonts.inter(color: AppColors.neutralLight),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Earnings:",
                      style: GoogleFonts.inter(color: AppColors.neutralLight),
                    ),
                    Text(
                      "N39300",
                      style: GoogleFonts.inter(color: AppColors.neutralLight),
                    )
                  ],
                ),
                MyButtons(
                  buttonText: "View Details",
                  buttonHeight: 50,
                  borderColor: AppColors.neutralLight,
                  textsize: 15,
                  buttonWidth: MediaQuery.of(context).size.width * 0.9,
                  buttonTextcolor: AppColors.neutral,
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => EarnPagemain(),
                    //   ),
                    // );
                  },
                ),
              ],
            ),
          ),
          textsCont(
              leadText: "Recent Transactions",
              trailWidget: Text(
                "View History",
                style: GoogleFonts.inter(),
              )),
          textsCont(
              leadText: "Transaction Date",
              trailWidget: Text(
                "May 12, 2025 | 09.30pm",
                style: GoogleFonts.inter(),
              )),
          theDividerline(),
          textsCont(
              leadText: "Recent Transactions",
              trailWidget: Text(
                "N1000",
                style: GoogleFonts.inter(),
              )),
          theDividerline(),
          textsCont(
              leadText: "Payment Source ",
              trailWidget: Text(
                "Voting",
                style: GoogleFonts.inter(),
              )),
          theDividerline(),
          textsCont(
              leadText: "Status ",
              trailWidget: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.greenAccent.shade100,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Completed",
                    style: GoogleFonts.inter(color: Colors.green.shade600),
                  ))),
          theDividerline(),
          textsCont(
              leadText: "Receipt ",
              trailWidget: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
                  decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Download",
                    style: TextStyle(color: AppColors.background),
                  ))),
          SizedBox(
            height: 15,
          ),
          MyButtons(
            buttonText: "Withdraw Earnings",
            buttonBackgroundColor: AppColors.primary,
            buttonHeight: 60,
            textsize: 15,
            buttonWidth: MediaQuery.of(context).size.width * 0.9,
            buttonTextcolor: AppColors.background,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => EarnPagemain(),
              //   ),
              // );
            },
          ),
          SizedBox(
            height: 15,
          ),
          MyButtons(
            buttonText: "View Payment History",
            borderColor: AppColors.neutral,
            buttonBackgroundColor: AppColors.transparent,
            buttonHeight: 60,
            textsize: 15,
            buttonWidth: MediaQuery.of(context).size.width * 0.9,
            buttonTextcolor: AppColors.neutralLight,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => EarnPagemain(),
              //   ),
              // );
            },
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }

  //divider method
  Divider theDividerline() {
    return Divider(
      height: 2,
      thickness: 2,
      indent: 17,
      endIndent: 23,
    );
  }

  //list of texts with their trailing widgets method
  ListTile textsCont({required String leadText, required Widget trailWidget}) {
    return ListTile(
      title: Text(
        leadText,
        style: GoogleFonts.inter(),
      ),
      trailing: trailWidget,
    );
  }

  //amount container method
  Container amountCont({required String text, required int amount}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          color: AppColors.neutralLightExtra,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Text(
                text,
                style: GoogleFonts.inter(),
              ),
              Text(
                "N$amount",
                style: GoogleFonts.inter(fontSize: 25),
              )
            ],
          ),
          Icon(Iconsax.eye_slash)
        ],
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          amountCont(text: "Voting Revenue", amount: 500000),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  "Choose Withdrawal Method",
                  style: GoogleFonts.inter(fontSize: 20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Mytextfield(text1: "Bank Transfer", text2: "Enter Account Details"),
          SizedBox(
            height: 15,
          ),
          Mytextfield(
            text1: "Bank Name",
            text2: "Stripe",
            sufIcon: Icon(Icons.keyboard_arrow_down_sharp),
          ),
          SizedBox(
            height: 15,
          ),
          MyButtons(
            buttonText: "Send",
            buttonBackgroundColor: AppColors.primary,
            buttonHeight: 60,
            textsize: 15,
            buttonWidth: MediaQuery.of(context).size.width * 0.9,
            buttonTextcolor: AppColors.background,
            onTap: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => EarnPagemain(),
              //   ),
              // );
            },
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  Container amountCont({required String text, required int amount}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          color: AppColors.neutralLightExtra,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Text(
                text,
                style: GoogleFonts.inter(),
              ),
              Text(
                "N$amount",
                style: GoogleFonts.inter(fontSize: 25),
              )
            ],
          ),
          Icon(Iconsax.eye_slash)
        ],
      ),
    );
  }
}
