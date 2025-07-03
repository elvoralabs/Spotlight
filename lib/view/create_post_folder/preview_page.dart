//this page comes up when the 'preview' button on pre-post page is clicked

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/models/select_media_model/selected_media_provider.dart';
import 'package:spotlight/view/create_post_folder/full_screenmedia_view.dart';
// import 'package:spotlight/view/create_post_folder/full_screenmedia_view.dart';

class PreviewImgagePage extends StatefulWidget {
  // final List<AssetEntity> selectedMedia;
  const PreviewImgagePage({
    super.key,
  });

  @override
  State<PreviewImgagePage> createState() => _PreviewImgagePageState();
}

class _PreviewImgagePageState extends State<PreviewImgagePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedMedia =
        Provider.of<SelectedMediaProvider>(context).selectedMedia;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
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
                  Spacer(),
                  MyButtons(
                      buttonText: "Next",
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

              //display the selcted images in a row
              if (selectedMedia.isNotEmpty)
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  padding: EdgeInsets.all(8),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: selectedMedia.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => FullscreenMediaViewer(
                                        // asset: selectedMedia[index]
                                        )));
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: AssetEntityImage(selectedMedia[index],
                                width: 250, height: 150, fit: BoxFit.contain),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
