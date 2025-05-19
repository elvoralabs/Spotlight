import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/view/earnings_folder/earn_pagemain_tabs.dart';

class EarnPagemain extends StatefulWidget {
  const EarnPagemain({super.key});

  @override
  State<EarnPagemain> createState() => _EarnPagemainState();
}

class _EarnPagemainState extends State<EarnPagemain> {
  int selectIndex = 0;
  late final List<Widget> tabs;

  @override
  void initState() {
    tabs = [const Tab1(), const Tab2(), Tab3()];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Text(
                  "Analytics",
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //earnings button
                      MyButtons(
                        buttonHeight: 40,
                        buttonWidth: 100,
                        textsize: 14,
                        buttonText: "Earnings",
                        buttonBackgroundColor: selectIndex == 0
                            ? AppColors.black
                            : AppColors.neutralLightExtra,
                        buttonTextcolor: selectIndex == 0
                            ? AppColors.background
                            : AppColors.black,
                        onTap: () {
                          setState(() {
                            selectIndex = 0;
                          });
                        },
                      ),

                      //payouts button
                      MyButtons(
                        buttonHeight: 40,
                        buttonWidth: 100,
                        textsize: 14,
                        buttonText: "Payouts",
                        buttonBackgroundColor: selectIndex == 1
                            ? AppColors.black
                            : AppColors.neutralLightExtra,
                        buttonTextcolor: selectIndex == 1
                            ? AppColors.background
                            : AppColors.black,
                        onTap: () {
                          setState(() {
                            selectIndex = 1;
                          });
                        },
                      ),

                      //revenue analytics button
                      MyButtons(
                        buttonHeight: 40,
                        buttonWidth: 150,
                        textsize: 14,
                        buttonText: "Revenue Analytics",
                        buttonBackgroundColor: selectIndex == 2
                            ? AppColors.black
                            : AppColors.neutralLightExtra,
                        buttonTextcolor: selectIndex == 2
                            ? AppColors.background
                            : AppColors.black,
                        onTap: () {
                          setState(() {
                            selectIndex = 2;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: tabs[selectIndex],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class Tab1 extends StatelessWidget {
//   const Tab1({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text("This is Tab 1"),
//       ],
//     );
//   }
// }

// class Tab2 extends StatelessWidget {
//   const Tab2({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text("This is Tab 2"),
//       ],
//     );
//   }
// }

class Tab3 extends StatelessWidget {
  const Tab3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("This is Tab 3"),
      ],
    );
  }
}
