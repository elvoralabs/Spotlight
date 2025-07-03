import 'package:camera/camera.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/view/temp_unknown/camera_page.dart';
import 'package:spotlight/view/create_post_folder/take_picture.dart';

String? selectedCategory;

class CreatePage extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CreatePage({super.key, required this.cameras});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  String? selectedCategory;
  bool isCompetitionOnly = false;

  final List<String> categories = [
    'Music',
    'Art',
    'Launch',
    'Competition',
    'Game',
    'Sponsor',
  ];
  @override
  void initState() {
    super.initState();
    selectedCategory = categories[0]; // Show 'Music' by default
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 50),
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Media Upload Section',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(
                  'video or image Supported formats : .mp4, .mov, .jpg, png. Max file size limit (e.g., 100MB).',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    color: AppColors.neutralLight,
                  ),
                ),
                Text(
                  'If you experience any issues reach out to our support team.',
                  style: GoogleFonts.inter(
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xff3B82F6),
                    fontSize: 13,
                    color: Color(0xff3B82F6),
                  ),
                ),

                //select video or image tab
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
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        MyButtons(
                          buttonText: "Browse",
                          buttonBackgroundColor: AppColors.transparent,
                          buttonHeight: 50,
                          buttonWidth: 150,
                          textsize: 15,
                          buttonTextcolor: AppColors.black,
                          borderColor: AppColors.neutralLight,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),

                //video caption section
                Text(
                  'Video Caption',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextField(
                  controller: TextEditingController(),
                  minLines: 4,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Enter your video caption',
                    hintStyle: TextStyle(
                      color: AppColors.neutralLight,
                      fontSize: 14,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(
                        12, 16, 12, 12), // Keeps hint at top-left
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                //video category section
                Text(
                  'Video Category',
                  style: GoogleFonts.inter(
                    fontSize: 15.0,
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  items: categories.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.inter(),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey, width: 1),
                    ),
                  ),
                ),

                //privacy settings section
                Text(
                  'Privacy Settings',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Competition Only',
                      style: TextStyle(fontSize: 15.0),
                    ),
                    Transform.scale(
                      scale: 0.75,
                      child: Switch(
                        value: isCompetitionOnly,
                        onChanged: (value) {
                          setState(() {
                            isCompetitionOnly = value;
                          });
                        },
                        activeColor: Colors
                            .green, // Optional: customize the active color
                      ),
                    ),
                  ],
                ),

                //post button
                MyButtons(
                  buttonText: "Post",
                  buttonBackgroundColor: AppColors.primary,
                  buttonHeight: 50,
                  buttonWidth: MediaQuery.of(context).size.width * 0.9,
                  buttonTextcolor: AppColors.background,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CameraPage(),
                      ),
                    );
                  },
                ),
                MyButtons(
                  buttonText: "Take Picture",
                  buttonBackgroundColor: AppColors.primary,
                  buttonHeight: 50,
                  buttonWidth: MediaQuery.of(context).size.width * 0.9,
                  buttonTextcolor: AppColors.background,
                  onTap: () async {
                    final cameras = await availableCameras();
                    final firstCamera = cameras.first;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TakePictureScreen(
                                camera: firstCamera,
                              )),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
