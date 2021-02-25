import 'package:flutter/material.dart';
import 'package:pixedio_works/helper_functions/helper_functions.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width <= 620 ? 10 : 100.0,
          vertical: 25.0,
        ),
        child: MainContent(),
      ),
    );
  }
}

const kheadingTextStyle = TextStyle(fontSize: 56.0);

class MainContent extends StatelessWidget {
  const MainContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = getContextSize(context).width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  softWrap: true,
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: headingTextSize(width), color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'WELCOME TO ',
                      ),
                      TextSpan(
                        text: 'PIXEDIO - DYNAMIC\nDESIGNS, ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'AND '),
                      TextSpan(
                        text: 'ENGAGING ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'PAGES'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  width: width <= 800 ? 300 : 600,
                  child: Wrap(direction: Axis.horizontal, children: [
                    Text(
                      "Nice to meet you ! My name is Dawson and I am a self taught Designer. My current tool is figma and I am now learning how to make realistic animations with Cinema 4D as you can see on my website (still learning so may be unable to incorporate to your design). I’d love to design and develop your website !",
                      style:
                          TextStyle(fontSize: bodyFontSize(width), height: 1.6),
                    ),
                  ]),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
