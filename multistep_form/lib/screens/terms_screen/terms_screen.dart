import 'package:flutter/material.dart';
import 'package:multistep_form/components/app_title.dart';
import 'package:multistep_form/components/body.dart';
import 'package:multistep_form/components/my_stepper.dart';
import 'package:multistep_form/constants.dart';
import 'package:multistep_form/screens/terms_screen/components/agree_button.dart';
import 'package:multistep_form/screens/terms_screen/components/terms_paragraph.dart';


class TermsScreen extends StatelessWidget {
  static const String id = 'terms_screen';

  @override
  Widget build(BuildContext context) {
    return Body(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 26.0, horizontal: kHorizontalPadding),
            child: Column(
              children: [
                AppTitle(),
                TermsParagraph(),
                
                AgreeButton()
              ],
            ),
          ),
          Expanded(child: MyStepper()),
        ],
      ),
    );
  }
}

