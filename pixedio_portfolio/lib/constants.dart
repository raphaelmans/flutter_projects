import 'package:flutter/material.dart';

const containerGradient = BoxDecoration(
  image: DecorationImage(
      image: AssetImage('web/assets/images/circles_bg.png'),
      alignment: Alignment.topRight),
  gradient: LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
    colors: [Color(0xffFFFFFF), Color(0xffDDE7F3)],
    tileMode: TileMode.repeated, // repeats the gradient over the canvas
  ),
);

const kmdBreakPoint = 768;
const kInputWidth = 400.0;

var kTextButtonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.resolveWith((states) => Colors.black),
  overlayColor:
      MaterialStateProperty.resolveWith((states) => Colors.transparent),
);
