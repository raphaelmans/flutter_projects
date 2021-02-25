import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kickngo/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: kBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 16,
              offset: Offset(0, -1),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              FontAwesomeIcons.home,
              color: kBottomActiveColor,
            ),
          ),
          Container(
            height: 75,
            width: 75,
            child: FlatButton(
                color: kHeadingColor,
                onPressed: () => null,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Icon(
                  FontAwesomeIcons.locationArrow,
                  color: Colors.white,
                )),
          ),
          IconButton(
            onPressed: () => null,
            icon: Icon(
              FontAwesomeIcons.solidHeart,
              color: kBottomInactiveColor,
            ),
          ),
        ],
      ),
    );
  }
}
