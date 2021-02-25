import 'package:flutter/material.dart';
import 'package:kickngo/constants.dart';
import 'package:kickngo/presentation/app_icons.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: FlatButton(
        color: kDrawerColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        child: Icon(
          AppIcons.gg_menu_left,
          color: kPrimaryTextColor,
          size: 18,
        ),
      ),
    );
  }
}
