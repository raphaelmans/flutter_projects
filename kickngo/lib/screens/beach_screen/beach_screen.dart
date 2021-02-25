import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kickngo/constants.dart';
import 'package:kickngo/presentation/app_icons.dart';

class BeachScreen extends StatefulWidget {
  @override
  _BeachScreenState createState() => _BeachScreenState();
}

class _BeachScreenState extends State<BeachScreen> {
  double circleSize = 200.0;
  bool loaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 500)).then((value) {
      setState(() {
        circleSize = 56;
      });
      Future.delayed(Duration(milliseconds: 500)).then((value) {
        setState(() {
          loaded = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
        child: Column(
          children: [
            Row(
              children: [
                Hero(
                  tag: 'Beach',
                  child: AnimatedContainer(
                    height: circleSize,
                    width: circleSize,
                    duration: Duration(milliseconds: 500),
                    decoration: BoxDecoration(
                      color: Color(0xff24A3B7),
                      borderRadius: BorderRadius.circular(circleSize),
                    ),
                    child: Icon(AppIcons.beach,color: Colors.white,),
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 600),
                  style: loaded
                      ? TextStyle(color: kPrimaryTextColor, fontSize: 18.0)
                      : TextStyle(
                          color: kBackgroundColor,
                        ),
                  child: Text(
                    loaded ? "Beaches" : "",
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
