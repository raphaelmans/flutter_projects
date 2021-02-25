import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kickngo/constants.dart';
import 'package:kickngo/screens/home_screen/components/categories_section.dart';
import 'package:kickngo/screens/home_screen/components/discover_section.dart';

import 'components/recommended_section.dart';



class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          DiscoverSection(),
          SizedBox(height: 48.0),
          CategoriesSection(),
          RecommendedSection()
        ],
      ),
    );
  }
}

