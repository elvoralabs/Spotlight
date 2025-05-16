import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:spotlight/view/menu_items_pages/preview_publish_page.dart';
import 'package:spotlight/view/menu_items_pages/rules_structure_page.dart';

class BrandingPage extends StatelessWidget {
  const BrandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView(children: [
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
                          vertical: 10.0, horizontal: 40.0),
                      child: Text(
                        'Branding',
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Customise tools for Colour Schemes',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Sponsor Logo',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  'image Supported formats: .jpg, png. Max file size limit (e.g., 10MB).',
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
                          builder: (context) => PreviewPublishPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.pink,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    child: Center(child: Text('Next')),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
