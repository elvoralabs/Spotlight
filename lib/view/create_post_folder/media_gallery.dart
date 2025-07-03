import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:photo_manager_image_provider/photo_manager_image_provider.dart';
import 'package:provider/provider.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/models/select_media_model/selected_media_provider.dart';
import 'package:spotlight/view/create_post_folder/pre_post_page.dart';

class MediaGalleryScreen extends StatefulWidget {
  const MediaGalleryScreen({super.key});

  @override
  State<MediaGalleryScreen> createState() => _MediaGalleryScreenState();
}

class _MediaGalleryScreenState extends State<MediaGalleryScreen>
    with SingleTickerProviderStateMixin {
  List<AssetEntity> photos = [];
  List<AssetEntity> videos = [];
  List<AssetEntity> selected = [];
  TabController? _tabController;

  int _currentPage = 0;
  bool _isLoadingMore = false;
  late AssetPathEntity? _currentAlbum;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initGallery();
    _tabController = TabController(length: 2, vsync: this);

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !_isLoadingMore) {
        _loadMore();
      }
    });
  }

  Future<void> _initGallery() async {
    final permission = await PhotoManager.requestPermissionExtend();
    if (!permission.isAuth) return;

    final albums =
        await PhotoManager.getAssetPathList(type: RequestType.common);
    if (albums.isEmpty) return;

    _currentAlbum = albums.first;
    final firstBatch =
        await _currentAlbum!.getAssetListPaged(page: 0, size: 60);

    setState(() {
      photos = firstBatch.where((e) => e.type == AssetType.image).toList();
      videos = firstBatch.where((e) => e.type == AssetType.video).toList();
      _currentPage = 1;
    });
  }

  Future<void> _loadMore() async {
    if (_currentAlbum == null) return;
    setState(() => _isLoadingMore = true);

    final nextBatch =
        await _currentAlbum!.getAssetListPaged(page: _currentPage, size: 60);

    setState(() {
      photos.addAll(nextBatch.where((e) => e.type == AssetType.image));
      videos.addAll(nextBatch.where((e) => e.type == AssetType.video));
      _currentPage++;
      _isLoadingMore = false;
    });
  }

  Widget _buildGrid(List<AssetEntity> media) {
    final selectedMedia =
        Provider.of<SelectedMediaProvider>(context).selectedMedia;
    return GridView.builder(
      controller: _scrollController,
      itemCount: media.length,
      padding: EdgeInsets.all(4),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        final asset = media[index];
        final isSelected = selectedMedia.contains(asset);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedMedia.remove(asset);
              } else {
                selectedMedia.add(asset);
              }
            });
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: AssetEntityImage(asset, fit: BoxFit.cover),
              ),
              if (isSelected)
                Positioned(
                  top: 4,
                  right: 4,
                  child: CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 10,
                    // child: Icon(Icons.check, size: 16, color: Colors.white),
                    child: Text(
                      (selectedMedia.indexOf(asset) + 1).toString(),
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedMedia =
        Provider.of<SelectedMediaProvider>(context).selectedMedia;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Media Upload Section",
          style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Text(
            'video or image Supported formats : .mp4, .mov, .jpg, png. Max file size limit (e.g., 100MB).',
            style: GoogleFonts.inter(
              fontSize: 15,
              color: AppColors.neutralLight,
            ),
          ),
          SizedBox(
            height: 10,
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
          SizedBox(
            height: 10,
          ),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: _tabController?.index == 0
                        ? AppColors.neutralLight
                        : AppColors.transparent,
                  ),
                  child: Text('Photos'),
                ),
              ),
              Tab(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: _tabController?.index == 1
                          ? AppColors.neutralLight
                          : AppColors.transparent),
                  child: Text('Videos'),
                ),
              ),
            ],
            onTap: (index) {
              setState(() {
                _tabController?.index = index;
              });
            },
          ),

          //gallery button to open images from gallery
          // GestureDetector(
          //   onTap: () async {
          //     final picked =
          //         await ImagePicker().pickImage(source: ImageSource.gallery);
          //     if (picked != null) {
          //       final file = File(picked.path);
          //       final filename = picked.name;
          //       AssetEntity? asset = await PhotoManager.editor.saveImage(
          //           await file.readAsBytes(),
          //           title: filename,
          //           filename: filename);
          //       setState(() {
          //         selected.add(asset);
          //       });
          //     }
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Row(
          //       // mainAxisSize: MainAxisSize.min,
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         Text(
          //           "Gallery",
          //           style: GoogleFonts.inter(
          //               fontSize: 14, fontWeight: FontWeight.bold),
          //         ),
          //         SizedBox(width: 3),
          //         Icon(Icons.keyboard_arrow_down),
          //       ],
          //     ),
          //   ),
          // ),
          // GestureDetector(
          //   onTap: () async {
          //     final picked =
          //         await ImagePicker().pickVideo(source: ImageSource.gallery);
          //     if (picked != null) {
          //       final file = File(picked.path);
          //       final filename = picked.name;
          //       AssetEntity? asset =
          //           await PhotoManager.editor.saveVideo(file, title: filename);
          //       setState(() {
          //         selected.add(asset);
          //       });
          //     }
          //   },
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Row(
          //       // mainAxisSize: MainAxisSize.min,
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: [
          //         Text(
          //           "video",
          //           style: GoogleFonts.inter(
          //               fontSize: 14, fontWeight: FontWeight.bold),
          //         ),
          //         SizedBox(width: 3),
          //         Icon(Icons.keyboard_arrow_down),
          //       ],
          //     ),
          //   ),
          // ),
          // // display the images or the videos in the gallery
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final picked = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (picked != null) {
                          final file = File(picked.path);
                          final filename = picked.name;
                          AssetEntity? asset = await PhotoManager.editor
                              .saveImage(await file.readAsBytes(),
                                  title: filename, filename: filename);
                          setState(() {
                            selectedMedia.add(asset);
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Gallery",
                              style: GoogleFonts.inter(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 3),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: _buildGrid(photos)),
                  ],
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final picked = await ImagePicker()
                            .pickVideo(source: ImageSource.gallery);
                        if (picked != null) {
                          final file = File(picked.path);
                          final filename = picked.name;
                          AssetEntity? asset = await PhotoManager.editor
                              .saveVideo(file, title: filename);
                          setState(() {
                            selectedMedia.add(asset);
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Gallery",
                              style: GoogleFonts.inter(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 3),
                            Icon(Icons.keyboard_arrow_down),
                          ],
                        ),
                      ),
                    ),
                    Expanded(child: _buildGrid(videos)),
                  ],
                )
              ],
            ),
          ),
          //button container with check icon, selcte multi next button
          Container(
            height: 80,
            color: AppColors.background,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(
                    selectedMedia.isNotEmpty
                        ? Icons.check_circle
                        : Icons.radio_button_unchecked,
                    color: selectedMedia.isNotEmpty
                        ? AppColors.primary
                        : AppColors.black,
                    size: 18,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Select Multiple',
                    style: GoogleFonts.inter(
                        fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  MyButtons(
                    buttonText: "Next (${selectedMedia.length})",
                    buttonBackgroundColor: selectedMedia.isNotEmpty
                        ? AppColors.primary
                        : AppColors.neutralLight,
                    buttonWidth: 96,
                    buttonHeight: 32,
                    buttonTextstyle: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: selectedMedia.isNotEmpty
                            ? AppColors.background
                            : AppColors.neutral),
                    onTap: () {
                      // Provider.of<SelectedMediaProvider>(context, listen: false)
                      // .setSelectedMedia(selected);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PrePostPage(),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //this section can display the selected images if uncommented
          // if (selected.isNotEmpty)
          //   Container(
          //     height: 100,
          //     color: Colors.grey.shade200,
          //     padding: EdgeInsets.all(8),
          //     child: ListView.builder(
          //       scrollDirection: Axis.horizontal,
          //       itemCount: selected.length,
          //       itemBuilder: (context, index) {
          //         return Padding(
          //           padding: EdgeInsets.symmetric(horizontal: 4),
          //           child: ClipRRect(
          //             borderRadius: BorderRadius.circular(8),
          //             child: AssetEntityImage(selected[index],
          //                 width: 80, height: 80, fit: BoxFit.cover),
          //           ),
          //         );
          //       },
          //     ),
          //   ),
        ],
      ),
      //also associated with the container that can display the selcted images
      //this tells the number of images selected and caan be used to navigate to the next page.
      // floatingActionButton: selected.isNotEmpty
      //     ? FloatingActionButton.extended(
      //         onPressed: () {
      //           // Do something with selected media
      //         },
      //         label: Text("Next (${selected.length})"),
      //         icon: Icon(Icons.arrow_forward),
      //       )
      //     : null,
    );
  }
}
