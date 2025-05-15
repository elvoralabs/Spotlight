import 'package:flutter/material.dart';

class HideableText extends StatefulWidget {
  final String text;

  const HideableText({Key? key, required this.text}) : super(key: key);

  @override
  _HideableTextState createState() => _HideableTextState();
}

class _HideableTextState extends State<HideableText> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (_isVisible)
          Text(
            widget.text,
            style: const TextStyle(fontSize: 16),
          ),
        TextButton(
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
          child: Text(_isVisible ? "Hide" : "Show"),
        ),
      ],
    );
  }
}
