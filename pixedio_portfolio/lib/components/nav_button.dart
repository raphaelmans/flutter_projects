import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  const NavButton({Key key, @required this.onPressed, @required this.text})
      : super(key: key);
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor:
            MaterialStateProperty.resolveWith((states) => Colors.black),
        overlayColor:
            MaterialStateProperty.resolveWith((states) => Colors.transparent),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: TextStyle(fontFamily: 'DMSans', fontWeight: FontWeight.w400),
      ),
    );
  }
}
