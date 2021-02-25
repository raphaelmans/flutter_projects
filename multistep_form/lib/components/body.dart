import 'package:flutter/material.dart';
import 'package:multistep_form/components/bottom_sheet.dart';


class Body extends StatelessWidget {
  final Widget child;

  const Body({Key key, this.child,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus.unfocus();
        },
        child: SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: child,
            bottomSheet: FormBottomSheet(
            ),
          ),
        ),
      );
  }
}
