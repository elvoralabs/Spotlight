import 'package:flutter/material.dart';
import 'package:spotlight/components/colors.dart';

class Mytextfield extends StatelessWidget {
  final String text1;
  final String text2;
  final bool? obscureText;
  final Widget? sufIcon;
  const Mytextfield(
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
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          TextField(
            controller: textController,
            strutStyle: StrutStyle(),
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              hintText: text2,
              hintStyle: TextStyle(fontSize: 11),
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
