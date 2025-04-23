import 'package:flutter/material.dart';

class TalentButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  TalentButton({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
              minimumSize: Size(0, 0), // 👈 removes default min width & height
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
