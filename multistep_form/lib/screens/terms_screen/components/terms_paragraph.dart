import 'package:flutter/material.dart';

import '../../../constants.dart';


class TermsParagraph extends StatelessWidget {
  const TermsParagraph({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(

      text: TextSpan(
          style: TextStyle(color: Colors.black,height: 1.5),
          children: [
            TextSpan(
              text: 'By registering, you agree to the ',
            ),
            TextSpan(
                style: TextStyle(
                  color: kPrimaryColor,
                  decoration: TextDecoration.underline,
                ),
                text: 'Terms and Conditions,'),
            TextSpan(
              text: 'and you have read our ',
            ),
            TextSpan(
                style: TextStyle(
                  color: kPrimaryColor,
                  decoration: TextDecoration.underline,
                ),
                text: 'Data Use Policy '),
            TextSpan(
              text: 'of our AVAL End User License',
            ),
          ]),
    );
  }
}