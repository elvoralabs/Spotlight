import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:spotlight/view/create_post_folder/media_gallery.dart';
import 'package:spotlight/view/create_post_folder/preview_page.dart';

class PrePostPage extends StatefulWidget {
  final List<AssetEntity> selectedMedia;
  const PrePostPage({super.key, this.selectedMedia = const []});

  @override
  State<PrePostPage> createState() => _PrePostPageState();
}

class _PrePostPageState extends State<PrePostPage> {
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
    selectedMedia = widget.selectedMedia;
    selectedCategory = categories[0]; // Show 'Music' by default
  }

  late List<AssetEntity> selectedMedia;

  // void _openGallery() async {
  //   final result = await Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => MediaGalleryScreen()),
  //   );
  //   if (result != null && result is List<AssetEntity>) {
  //     setState(() {
  //       selectedMedia = result;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //header
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/guy.png'),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text('Paul Rodriquez',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                    Spacer(),
                    MyButtons(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PreviewImgagePage(
                                selectedMedia: selectedMedia,
                              ),
                            ),
                          );
                        },
                        buttonText: "Preview",
                        buttonBackgroundColor: AppColors.primary,
                        buttonWidth: 96,
                        buttonHeight: 32,
                        buttonTextstyle: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.background,
                        )),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),

                //textfield: aadd caption to post
                TextField(
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Add caption to your post...',
                    hintStyle: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutralLight,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.transparent),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.transparent),
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),

                //display the edit and close buttons if the there are selected images
                selectedMedia.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 60,
                                height: 28,
                                decoration:
                                    BoxDecoration(color: AppColors.black),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.edit_outlined,
                                        size: 13,
                                        color: AppColors.background,
                                      ),
                                      Text(
                                        'Edit(${selectedMedia.length})',
                                        style: GoogleFonts.inter(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.background),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                width: 43,
                                height: 28,
                                decoration: BoxDecoration(
                                    color: AppColors.black,
                                    borderRadius: BorderRadius.circular(2.32)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0, vertical: 5),
                                  child: Icon(
                                    Icons.cancel_outlined,
                                    size: 15,
                                    color: AppColors.background,
                                  ),
                                ))
                          ],
                        ),
                      )
                    : SizedBox.shrink(),

                //display the selected images
                selectedMedia.isNotEmpty
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: selectedMedia.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemBuilder: (context, index) {
                          final asset = selectedMedia[index];
                          return AssetEntityImage(
                            asset,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 100,
                          );
                        },
                      )
                    : SizedBox.shrink(),

                //add tag people text
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(
                        Icons.person,
                        color: AppColors.textPrimary,
                      ),
                      label: Text(
                        'Tag people',
                        style: GoogleFonts.inter(
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),

                //post category section
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Post Category',
                      style: GoogleFonts.inter(
                          fontSize: 13.0, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  value: selectedCategory,
                  items: categories.map((item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(
                        item,
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
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
                        EdgeInsets.symmetric(horizontal: 15, vertical: 16),
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
                SizedBox(
                  height: 25,
                ),

                //privacy policy section
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Privacy policy',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Public',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.65,
                      child: Switch(
                        thumbColor:
                            WidgetStatePropertyAll(AppColors.background),
                        activeTrackColor: AppColors.black,
                        trackOutlineColor:
                            MaterialStateProperty.all(AppColors.background),
                        value: isCompetitionOnly,
                        onChanged: (value) {
                          setState(() {
                            isCompetitionOnly = value;
                          });
                        }, // Optional: customize the active color
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Private',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.65,
                      child: Switch(
                        thumbColor:
                            WidgetStatePropertyAll(AppColors.background),
                        activeTrackColor: AppColors.black,
                        trackOutlineColor:
                            MaterialStateProperty.all(AppColors.background),
                        value: isCompetitionOnly,
                        onChanged: (value) {
                          setState(() {
                            isCompetitionOnly = value;
                          });
                        }, // Optional: customize the active color
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Official competition only',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Transform.scale(
                      scale: 0.65,
                      child: Switch(
                        thumbColor:
                            WidgetStatePropertyAll(AppColors.background),
                        activeTrackColor: AppColors.black,
                        trackOutlineColor:
                            MaterialStateProperty.all(AppColors.background),
                        value: isCompetitionOnly,
                        onChanged: (value) {
                          setState(() {
                            isCompetitionOnly = value;
                          });
                        }, // Optional: customize the active color
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),

                //post button
                MyButtons(
                  buttonText: "Post",
                  buttonBackgroundColor: AppColors.primary,
                  buttonHeight: 50,
                  buttonWidth: MediaQuery.of(context).size.width * 1.0,
                  buttonTextstyle: GoogleFonts.inter(
                    fontSize: 20,
                    color: AppColors.background,
                    fontWeight: FontWeight.w600,
                  ),
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => CameraPage(),
                    //   ),
                    // );
                  },
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
