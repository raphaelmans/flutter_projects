import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Tracing',
      home: Scaffold(
        body: Center(
          child: Text('Something Went Wrong!'),
        ),
      ),
    );
  }
}
