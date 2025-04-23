import 'package:flutter/material.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/login_signup_pages/login_folder/loginPage.dart';
import 'package:spotlight/screens/transition_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: TransitionScreens(),
    );
  }
}
