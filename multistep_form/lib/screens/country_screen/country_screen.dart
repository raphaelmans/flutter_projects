import 'package:flutter/material.dart';
import 'package:multistep_form/components/app_title.dart';
import 'package:multistep_form/components/body.dart';
import 'package:multistep_form/components/my_stepper.dart';

import 'package:multistep_form/screens/country_screen/components/country_list.dart';

import '../../constants.dart';


class CountryScreen extends StatelessWidget {

  static const String id = 'country_screen';

  @override
  Widget build(BuildContext context) {
    return Body(
      child: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 26.0, horizontal: kHorizontalPadding),
            child: Column(
              children: [
                AppTitle(),
                MyCountryLists(),

              ],
            ),
          ),
          Expanded(child: MyStepper()),
        ],
      ),
    );
  }
}
