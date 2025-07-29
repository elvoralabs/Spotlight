import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:spotlight/components/colors.dart';
import 'package:spotlight/components/my_buttons.dart';

class EditCompScreen extends StatefulWidget {
  final String title;
  final String thumbnail;

  const EditCompScreen(
      {super.key, required this.title, required this.thumbnail});

  @override
  State<EditCompScreen> createState() => _EditCompScreenState();
}

class _EditCompScreenState extends State<EditCompScreen> {
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

  String? selectedGenre;
  List<String> genders = ['Dance', 'Arts'];

  @override
  void initState() {
    super.initState();
    selectedGenre = genders[0]; // Default selection
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            // Header
            Row(
              children: [
                GestureDetector(
                  child: Icon(Icons.keyboard_arrow_left_rounded),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Edit Competition',
                    style: GoogleFonts.inter(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),

            //image container
            Stack(
              children: [
                Container(
                  height: 261,
                  padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.thumbnail),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: GoogleFonts.inter(
                            color: AppColors.background,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'N10 Million Cash Prize',
                        style: GoogleFonts.inter(
                            color: AppColors.background,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),

            //edit media text
            Text(
              'Edit Media',
              style:
                  GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 15,
            ),

            //title textfield
            Text(
              'Title',
              style:
                  GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              // controller: textController,
              strutStyle: StrutStyle(),
              decoration: InputDecoration(
                hintText: 'Afro Dance Challenge',
                hintStyle: GoogleFonts.inter(
                    color: AppColors.neutralLight,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //organizer textfield
            Text(
              'Organizer name',
              style:
                  GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              // controller: textController,
              strutStyle: StrutStyle(),
              decoration: InputDecoration(
                hintText: 'Street dance',
                hintStyle: GoogleFonts.inter(
                    color: AppColors.neutralLight,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //status badge
            Text(
              'Status Badge',
              style:
                  GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              // controller: textController,
              strutStyle: StrutStyle(),
              decoration: InputDecoration(
                hintText: 'Live',
                hintStyle: GoogleFonts.inter(
                    color: AppColors.neutralLight,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //start date
            Text(
              'Start date/End Date',
              style:
                  GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                          color: AppColors.neutralLight),
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
            SizedBox(
              height: 15,
            ),

            //video category
            Text(
              'Category',
              style:
                  GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5,
            ),
            DropdownButtonFormField<String>(
              value: selectedGenre,
              items: genders.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: GoogleFonts.openSans(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.neutralLight),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
              decoration: InputDecoration(
                hintText: selectedGenre,
                // hintStyle: TextStyle(fontSize: 15),
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
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //cancel buttons
            MyButtons(
              buttonText: 'Cancel',
              buttonWidth: double.infinity,
              buttonHeight: 48,
              buttonBackgroundColor: AppColors.neutralLight,
              buttonTextstyle: GoogleFonts.inter(
                  color: AppColors.background,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MngControlScreen(
                //       title: vl['title'],
                //       thumbnail: vl['thumbnail'],
                //     ),
                //   ),
                // );
              },
            ),
            SizedBox(
              height: 15,
            ),

            //save changes
            MyButtons(
              buttonText: 'Save Changes',
              buttonWidth: double.infinity,
              buttonHeight: 48,
              buttonBackgroundColor: AppColors.primary,
              buttonTextstyle: GoogleFonts.inter(
                  color: AppColors.background,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => MngControlScreen(
                //       title: vl['title'],
                //       thumbnail: vl['thumbnail'],
                //     ),
                //   ),
                // );
              },
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      )),
    );
  }
}
