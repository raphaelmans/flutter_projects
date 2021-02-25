

import 'package:flutter/material.dart';

class PreLaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Tracing',
      home: Scaffold(
        body: Center(
          child: CircularProgressIndicator(

          )
        ),
      ),
    );
  }
}
