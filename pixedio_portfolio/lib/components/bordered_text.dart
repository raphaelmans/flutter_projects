import 'package:flutter/material.dart';
import 'package:pixedio_works/helper_functions/helper_functions.dart';

class BorderedText extends StatelessWidget {
  double _fontSize(width) {
    var fontsize = 25.0;
    if (width < 1076) {
      fontsize = 18;
    }
    if (width < 400) {
      fontsize = 14;
    }
    return fontsize;
  }

  EdgeInsets _boxPadding(width) {
    var padding = EdgeInsets.only(
      left: 60.0,
      right: 60.0,
      top: 20.0,
      bottom: 20.0,
    );
    if (width < 500) {
      padding = EdgeInsets.only(
        left: 12.0,
        right: 12.0,
        top: 5,
        bottom: 5,
      );
    }
    return padding;
  }

  const BorderedText(
    this.text, {
    Key key,
  }) : super(key: key);
  final text;
  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Container(
      padding: _boxPadding(size.width),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 5.0,
        ),
      ),
      child: Text(
        text,
        softWrap: false,
        style: TextStyle(
          fontSize: _fontSize(size.width),
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w700,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
