import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  static const String id = 'scan_dashboard';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Place'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sample Company',style: Theme.of(context).textTheme.headline4,),
            Text('Location',style: Theme.of(context).textTheme.overline,)
          ],
        ),
      ),
    );
  }
}
