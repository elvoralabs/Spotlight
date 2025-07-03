import 'dart:io';

import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';
import 'package:spotlight/components/my_circlebuttons.dart';
import 'package:spotlight/components/my_signup_appbar.dart';
import 'package:spotlight/view/login_signup_pages/sign_up_folder/signup_getspotted.dart';

class SignupFinalpage extends StatefulWidget {
  const SignupFinalpage({super.key});

  @override
  State<SignupFinalpage> createState() => _SignupFinalpageState();
}

class _SignupFinalpageState extends State<SignupFinalpage> {
  //select gender
  String? selectedGender;
  List<String> genders = ['Male', 'Female'];

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  String _myName = '';
  String _myPassword = '';
  String _myConfirmPassword = '';

  //controllers to select the country and state and/or city
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    selectedGender = genders[0]; // Default selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              spacing: 10,
              children: [
                MySignUpAppbar(
                  pageText: "Sign Up",
                ),
                SizedBox(
                  height: 20,
                ),

                //profile picture
                GestureDetector(
                  onTap: () => _pickImage(ImageSource.gallery),
                  child: Stack(
                    children: [
                      _image != null
                          ? Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.primary,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(22, 91, 78, 78),
                                    blurRadius: 3,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                  radius: 75,
                                  backgroundImage: FileImage(_image!)),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.black,
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(22, 91, 78, 78),
                                    blurRadius: 3,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: CircleAvatar(
                                backgroundColor: AppColors.neutralLightExtra,
                                radius: 75,
                                child: Icon(
                                  Icons.person,
                                  size: 75,
                                ),
                              ),
                            ),
                      Positioned(
                        bottom: 10, // Position at the bottom
                        right: 10, // Position at the right
                        child: SvgPicture.asset('assets/images/edit-photo.svg',
                            width: 34, height: 34),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Upload your profile picture',
                  style: GoogleFonts.openSans(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: AppColors.neutralLight),
                ),
                SizedBox(
                  height: 20,
                ),

                //name
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Full Name',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        onChanged: (value) => setState(() {
                          _myName = value;
                        }),
                        controller: nameController,
                        strutStyle: StrutStyle(),
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter Full Name',
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: AppColors
                                    .neutralLight), // Red border when not focused
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 2), // Red border when focused
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                        ),
                      ),
                    ],
                  ),
                ),

                //gender
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Gender',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                      DropdownButtonFormField<String>(
                        value: selectedGender,
                        items: genders.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: GoogleFonts.openSans(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Choose your Gender',
                          hintStyle: TextStyle(fontSize: 15),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: AppColors
                                    .neutralLight), // Red border when not focused
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 2), // Red border when focused
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                        ),
                      ),
                    ],
                  ),
                ),

                //date of birth
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Date of Birth',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(color: AppColors.neutralLight),
                            borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          spacing: 10,
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                DateFormat('yyyy/MM/dd').format(_selectedDate),
                                style: GoogleFonts.openSans(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.black),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () => _selectDate(context),
                              child: Center(
                                  child: Icon(
                                Iconsax.calendar,
                                size: 19,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                CountryStateCityPicker(
                  country: country,
                  state: state,
                ),

                //password
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Password',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        onChanged: (value) => setState(() {
                          _myPassword = value;
                        }),
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Enter your password',
                          hintStyle: TextStyle(fontSize: 15),
                          suffixIcon: Icon(Iconsax.eye_slash),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: AppColors
                                    .neutralLight), // Red border when not focused
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 2), // Red border when focused
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your password must have:",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "> 8 to 20 characters",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Text(
                            "> Letters, numbers and special characters",
                            style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //password
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    spacing: 12,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                            fontSize: 17.0, fontWeight: FontWeight.bold),
                      ),
                      TextField(
                        onChanged: (value) => setState(() {
                          _myConfirmPassword = value;
                        }),
                        controller: confirmpasswordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: false,
                        decoration: InputDecoration(
                          hintText: 'Confirm your password',
                          hintStyle: TextStyle(fontSize: 15),
                          suffixIcon: Icon(Iconsax.eye_slash),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: AppColors
                                    .neutralLight), // Red border when not focused
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                                color: AppColors.primary,
                                width: 2), // Red border when focused
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                //signup button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyButtons(
                      buttonText: "Sign Up",
                      buttonBackgroundColor: (_myName.trim().isEmpty ||
                              _myPassword.trim().isEmpty ||
                              _myConfirmPassword.trim().isEmpty ||
                              country.text.trim().isEmpty ||
                              state.text.trim().isEmpty)
                          ? AppColors.primarylight
                          : AppColors.primary,
                      buttonHeight: 50,
                      buttonWidth: MediaQuery.of(context).size.width * 0.9,
                      buttonTextcolor: (_myName.trim().isEmpty ||
                              _myPassword.trim().isEmpty ||
                              _myConfirmPassword.trim().isEmpty ||
                              country.text.trim().isEmpty ||
                              state.text.trim().isEmpty)
                          ? AppColors.neutralLight
                          : AppColors.background,
                      onTap: () {
                        if (_myName.trim().isEmpty ||
                            _myPassword.trim().isEmpty ||
                            _myConfirmPassword.trim().isEmpty ||
                            country.text.trim().isEmpty ||
                            state.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.primary,
                              content: Text(
                                'Please fill all the fields!',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                          return;
                        }
                        if (_myPassword != _myConfirmPassword) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: AppColors.primary,
                              content: Text(
                                'Password does not match!',
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                          return;
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignupGetspotted(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyItems extends StatelessWidget {
  final String text1;
  final String text2;
  final bool? obscureText;
  final Widget? sufIcon;
  const MyItems(
      {super.key,
      required this.text1,
      required this.text2,
      this.obscureText,
      this.sufIcon});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController =
        TextEditingController(); // Default initialization
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        spacing: 12,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Text(
            text1,
            style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: textController,
            strutStyle: StrutStyle(),
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              hintText: text2,
              hintStyle: TextStyle(fontSize: 15),
              suffixIcon: sufIcon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color:
                        AppColors.neutralLight), // Red border when not focused
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: AppColors.primary,
                    width: 2), // Red border when focused
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            ),
          ),
        ],
      ),
    );
  }
}
