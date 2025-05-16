import 'package:flutter/material.dart';

class VideoList {
  List<Map<String, dynamic>> videos = [
    //two options here for the genre sorting:
    //1. sort from the frontend here on flutter
    //2. sort on the backend, allowing the users to select genre type wjen uploading the video
    {
      'id': 1,
      'genre': 'Music',
      'creator': 'Simuby Ade',
      'time': '2days',
      'title': 'New Music Fresstyle',
      'thumbnail': 'assets/images/guy_two.png',
      'profilePic': 'assets/images/i1.png',
    },
    {
      'id': 2,
      'genre': 'Art',
      'creator': 'Johnson Fuller',
      'time': '2days',
      'title': 'Single Blessings',
      'thumbnail': 'assets/images/bab.png',
      'profilePic': 'assets/images/i2.png',
    },
    {
      'id': 3,
      'genre': 'Dance',
      'creator': 'Ben Gyts',
      'time': '2days',
      'title': 'Dance in the rain',
      'thumbnail': 'assets/images/i3.png',
      'profilePic': 'assets/images/i2.png',
    },
    {
      'id': 4,
      'genre': 'Music',
      'creator': 'Samosin Iluis',
      'time': '2days',
      'title': 'Dance in the rain',
      'thumbnail': 'assets/images/guy.png',
      'profilePic': 'assets/images/bab.png',
    },
    {
      'id': 5,
      'genre': 'Art',
      'creator': 'Ben Gyts',
      'time': '2days',
      'title': 'Dance in the rain',
      'thumbnail': 'assets/images/guy_two.png',
      'profilePic': 'assets/images/bab.png',
    },
    {
      'id': 6,
      'genre': 'Dance',
      'creator': 'Ben Gyts',
      'time': '2days',
      'title': 'Dance in the rain',
      'thumbnail': 'assets/images/guy.png',
      'profilePic': 'assets/images/bab.png',
    },
  ];
}
