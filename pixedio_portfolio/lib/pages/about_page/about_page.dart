import 'package:flutter/material.dart';
import 'package:pixedio_works/components/bordered_text.dart';
import 'package:pixedio_works/components/container_designed.dart';
import 'package:pixedio_works/components/header_nav.dart';
import 'package:pixedio_works/helper_functions/helper_functions.dart';
import 'package:pixedio_works/pages/home_page/sections/footer.dart';

class AboutPage extends StatelessWidget {
  static const String id = 'about_page';
  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Scaffold(
      body: ContainerDesigned(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: size.height,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BorderedText('ABOUT'),
                        SizedBox(height: 50.0),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: 400, maxWidth: 600),
                          child: Wrap(
                            direction: Axis.horizontal,
                            children: [
                              Text(
                                'Nice to meet you ! My name is Dawson and I am a self taught Designer. Design is everything, it envokes emotion and engages the viewer. The expereince and interface defines your brand and targets your users. I understand how important dynamic and robust designs are to your business and image.  My main tool at the moment is Figma - a collaborative interface tool. I have started learning how to utilize Adobe design products and also Cinema 4D, as you can see from the animation on the home page. Drop me a message to say hi or to get in touch !',
                                style: TextStyle(
                                  height: 2.0,
                                  fontSize: bodyFontSize(size.width),
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Footer(),
              ]),
            ),
            HeaderNav(),
          ],
        ),
      ),
    );
  }
}
