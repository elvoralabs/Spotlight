import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:spotlight/homepages/menu_items_pages/rules_structure_page.dart';

class CreateEventTitle extends StatelessWidget {
  const CreateEventTitle({super.key});

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
                            vertical: 10.0, horizontal: 30.0),
                        child: Text(
                          'Event Creation',
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
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Event Title',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextField(
                          controller: TextEditingController(),
                          minLines: 1,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Enter event title',
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
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextField(
                          controller: TextEditingController(),
                          minLines: 4,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText:
                                'Where words fail | Music speaks | Music Lover I Create Music that Loves the world and into and high level of spirituality and possibilities.',
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
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            'Date & Time',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        TextField(
                          controller: TextEditingController(),
                          minLines: 1,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Enter date & time',
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Location ( Optional )',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      TextField(
                        controller: TextEditingController(),
                        minLines: 1,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Enter location',
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
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Media Upload Section',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'video or image Supported formats: .mp4, .mov, .jpg, png. Max file size limit (e.g., 100MB).',
              style: TextStyle(fontSize: 13, color: Color(0xFF212121)),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                'If you experience any issues reach out to our support team.',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Color(0xff3B82F6),
                  fontSize: 13,
                  color: Color(0xff3B82F6),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            DottedBorder(
              color: Color(0xffD9D9D9),
              strokeWidth: 1,
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              dashPattern: [6, 3],
              child: Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: Color(0xffF7FCFF),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.file_upload_outlined),
                    Text(
                      'Drag & Drop or Select from Device',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: BorderSide(
                                color: Color(0xffD9D9D9),
                              ))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40.0,
                          vertical: 3.0,
                        ),
                        child: Text(
                          'Browse',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => RulesStructurePage(),
                    ),
                  );
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
