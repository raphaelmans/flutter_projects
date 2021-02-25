import 'package:flutter/material.dart';
import 'package:multistep_form/constants.dart';

class SuccessfulScreen extends StatelessWidget {
  static const String id = 'successful_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 140,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Successful',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.white),
            ),
            SizedBox(height: 20),
            Text(
              'A verification email has been sent to you.\n Please click on the activation link to confirm your account.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16.0,height: 1.6),
            ),
          ],
        )),
      ),
    );
  }
}
