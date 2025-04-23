import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:spotlight/homepages/vote_payment_page.dart';

class RulesStructurePage extends StatefulWidget {
  const RulesStructurePage({super.key});

  @override
  State<RulesStructurePage> createState() => _RulesStructurePageState();
}

class _RulesStructurePageState extends State<RulesStructurePage> {
  bool isCompetitionOnlyFree = false;
  bool isCompetitionOnlyPaid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'Rules & Structure',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xffF5F5F5),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text(
                          'Event Management',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Rules',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextField(
                          controller: TextEditingController(),
                          minLines: 3,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Enter rules details',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 13,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(
                                12, 16, 12, 12), // Keeps hint at top-left
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Entry Requirements',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextField(
                          controller: TextEditingController(),
                          minLines: 3,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Enter Requirement',
                            hintStyle: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: 13,
                            ),
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(
                                12, 16, 12, 12), // Keeps hint at top-left
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Free',
                  style: TextStyle(fontSize: 13.0),
                ),
                Transform.scale(
                  scale: 0.55,
                  child: Switch(
                    value: isCompetitionOnlyFree,
                    onChanged: (value) {
                      setState(() {
                        isCompetitionOnlyFree = value;
                      });
                    },
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.red,
                    // Optional: customize the active color
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Paid',
                  style: TextStyle(fontSize: 13.0),
                ),
                Transform.scale(
                  scale: 0.55,
                  child: Switch(
                    value: isCompetitionOnlyPaid,
                    onChanged: (value) {
                      setState(() {
                        isCompetitionOnlyPaid = value;
                      });
                    },
                    activeColor: Colors.green,
                    inactiveThumbColor:
                        Colors.red, // Optional: customize the active color
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => VotePaymentPage()));
                },
                style: TextButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))),
                child: Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
