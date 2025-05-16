import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_appbar.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  TextEditingController userCommentController = TextEditingController();

  bool sendTrue = false;

  void initState() {
    super.initState();
    sendTrue = false;
    userCommentController = TextEditingController();
  }

  //list of comments
  List<Map<String, dynamic>> commentsList = [
    {
      "id": 1,
      "commenterPic": 'assets/images/guy.png',
      "commenterName": "Ayomide Lucas",
      "commenterComment":
          "I really love this video, it is amazing and lovely, looking forward t the best and hoping to see you soonest",
      "commentTime": "22h",
      "commentLikes": 20,
      "isLiked": false,
    },
    {
      "id": 2,
      "commenterPic": 'assets/images/guy_two.png',
      "commenterName": "Ayomide Lucas",
      "commenterComment":
          "I really ld t the best and hoping to see you soonest",
      "commentTime": "22h",
      "commentLikes": 0,
      "isLiked": false,
    },
    {
      "id": 3,
      "commenterPic": 'assets/images/man2.jpg',
      "commenterName": "Lide Simi",
      "commenterComment":
          "I realking forward t the best and hoping to see you soonest",
      "commentTime": "22h",
      "commentLikes": 12,
      "isLiked": false,
    },
    {
      "id": 4,
      "commenterPic": 'assets/images/m2.png',
      "commenterName": "Shina Almera",
      "commenterComment":
          "I really love thirward t the best and hoping to see you soonest",
      "commentTime": "22h",
      "commentLikes": 15,
      "isLiked": false,
    },
    {
      "id": 5,
      "commenterPic": 'assets/images/guy.png',
      "commenterName": "Chidera Olike",
      "commenterComment": "I nd lovely, looking forward t the bsee you soonest",
      "commentTime": "22h",
      "commentLikes": 29,
      "isLiked": false,
    },
    {
      "id": 6,
      "commenterPic": 'assets/images/girl.jpg',
      "commenterName": "Lola Perez",
      "commenterComment": "I look forward to the best",
      "commentTime": "12h",
      "commentLikes": 34,
      "isLiked": false,
    },
  ];

  //function to toggle the like for a specific comment
  void toggleLike(int commentId) {
    setState(() {
      //get the specific comment using its Id
      final commentIndex =
          commentsList.indexWhere((comment) => comment['id'] == commentId);
      if (commentIndex != -1) {
        //toggle the like status
        bool isCurrentlyLiked = commentsList[commentIndex]['isLiked'] ?? false;
        commentsList[commentIndex]['isLiked'] = !isCurrentlyLiked;
        //update the number of likes
        commentsList[commentIndex]['commentLikes'] =
            (commentsList[commentIndex]['commentLikes'] ?? 0) +
                (isCurrentlyLiked ? -1 : 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20)), // Rounded top edges
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  color: Colors.white, // Background color of the content
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        // Heading row showing "comments" and close button
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(width: 30),
                              Expanded(
                                child: Container(
                                  width: 100,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 118.0),
                                        child: Divider(
                                          height: 16,
                                          color: AppColors.black,
                                        ),
                                      ),
                                      Text(
                                        "Comments",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(height: 16),

                        // List of comments using a list view builder
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.63,
                          // height: 500,
                          child: ListView.builder(
                              itemCount: commentsList.length,
                              itemBuilder: (context, index) {
                                final comment = commentsList[index];
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: 10,
                                    children: [
                                      CircleAvatar(
                                        radius: 20.0,
                                        backgroundImage: AssetImage(
                                            comment['commenterPic'] ??
                                                'assets/images/guy.png'),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              comment['commenterName'],
                                              style: GoogleFonts.inter(
                                                  color: AppColors.neutral),
                                            ),
                                            Text(
                                              textAlign: TextAlign.justify,
                                              comment['commenterComment'],
                                              style: GoogleFonts.inter(
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Row(
                                              spacing: 15,
                                              children: [
                                                Text(
                                                  comment['commentTime'] ?? '',
                                                  style: GoogleFonts.inter(
                                                      color: AppColors.neutral,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "Reply",
                                                  style: GoogleFonts.inter(
                                                      color: AppColors.neutral,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () =>
                                                toggleLike(comment['id']),
                                            child: Icon(
                                                comment['isLiked'] ?? false
                                                    ? Icons.favorite
                                                    : Icons.favorite_border,
                                                color: comment['isLiked'] ??
                                                        false
                                                    ? AppColors.primary
                                                    : AppColors.neutralLight),
                                          ),
                                          Text(comment['commentLikes']
                                              .toString()),
                                          SizedBox(width: 15),
                                          Icon(Icons.thumb_down_alt_outlined,
                                              color: AppColors.neutralLight),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // Current user comment box
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              color: Colors.white, // Optional: Add a background color
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundImage: AssetImage('assets/images/guy.png'),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        controller: userCommentController,
                        onTap: () {
                          // Handle the text field tap
                        },
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            setState(() {
                              sendTrue = true;
                            });
                          } else {
                            setState(() {
                              sendTrue = false;
                            });
                          }
                        },
                        onSubmitted: (value) {
                          // Handle the comment submission
                          if (value.isNotEmpty) {
                            // Add the comment to the list
                            setState(() {
                              commentsList.add({
                                "id": commentsList.length + 1,
                                "commenterPic": 'assets/images/guy.png',
                                "commenterName": "You",
                                "commenterComment": value,
                                "commentTime": "Just now",
                                "commentLikes": 0,
                                "isLiked": false,
                              });
                              userCommentController.clear();
                            });
                          }
                        },
                        decoration: InputDecoration(
                          fillColor: AppColors.neutralLightExtra,
                          filled: true,
                          hintText: "Add a comment...",
                          hintStyle: TextStyle(color: AppColors.neutral),
                          suffixIcon: IconButton(
                            icon: Icon(
                              sendTrue ? Icons.send : Iconsax.sticker,
                              size: 19,
                            ),
                            onPressed: () {},
                            color: AppColors.neutral,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
