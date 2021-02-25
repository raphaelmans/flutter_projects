import 'package:flutter/material.dart';
import 'package:kickngo/constants.dart';
import 'package:kickngo/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: kBackgroundColor,
              elevation: 0,
        ),
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: 'OpenSans',
      ),
      home: AppSplashScreen(),
    );
  }
}


