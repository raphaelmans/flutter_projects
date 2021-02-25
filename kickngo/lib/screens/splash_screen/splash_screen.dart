import 'package:flutter/material.dart';
import 'package:kickngo/constants.dart';
import 'package:kickngo/screens/home_screen/home_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class AppSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MySplashScreen();
  }
}


class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: Color(0xffD7E3FC),
      title: Text(
        "KICK'N GO",
        style: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 15,
          color: kPrimaryTextColor,
        ),
      ),
      seconds: 3,
      navigateAfterSeconds: HomeScreen(),
      image: Image.asset(
        'assets/images/app_logo.png',
      ),
      photoSize: 175.0,
      loaderColor: kCBorderColor,
      loadingText: Text(
        'Your Digital Travel Companion',
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w300,
          color: kHeadingColor,
        ),
      ),
    );
  }
}
