import 'package:flutter/material.dart';

class ContainerDesigned extends StatelessWidget {
  const ContainerDesigned(
      {Key key, this.child, this.height, this.width, this.hasCircle = true})
      : super(key: key);
  final child;
  final height, width;
  final bool hasCircle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: hasCircle
            ? DecorationImage(
                image: AssetImage('web/assets/images/circles_bg.png'),
                alignment: Alignment.center)
            : null,
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          // colors: [Color(0xffFFFFFF), Color(0xffDDE7F3)],
          colors: [Color(0xffD0D8E8), Color(0xffEFF3F9)],
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: child,
    );
  }
}
