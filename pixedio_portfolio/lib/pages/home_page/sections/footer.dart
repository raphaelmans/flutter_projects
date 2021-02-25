import 'package:flutter/material.dart';
import 'package:pixedio_works/components/nav_button.dart';
import 'package:pixedio_works/helper_functions/helper_functions.dart';
import 'package:pixedio_works/pages/about_page/about_page.dart';
import 'package:pixedio_works/pages/contacts_page/contacts_page.dart';
import 'package:pixedio_works/pages/portfolio_page/portfolio_page.dart';
import 'package:pixedio_works/pages/services_page/services_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../home_page.dart';

class Footer extends StatelessWidget {
  const Footer({
    Key key,
    this.contactsKey,
    this.contactsPressed,
  }) : super(key: key);

  final GlobalKey contactsKey;
  final VoidCallback contactsPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0xffFFFFFF), Color(0xffDDE7F3)],
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              style: kTextButtonStyle,
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, MyHomePage.id),
              child: Text(
                'Pixedio',
                style: TextStyle(fontFamily: 'Cervanttis', fontSize: 32.0),
              ),
            ),
            Text(
              "Copyright © 2020. Pixedio. All rights reserved.",
            ),
            Container(
              width: 600.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NavButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, AboutPage.id),
                    text: 'About',
                  ),
                  Spacer(),
                  NavButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, PortfolioPage.id),
                    text: 'Portfolio',
                  ),
                  Spacer(),
                  NavButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                        context, ServicesPage.id),
                    text: 'Services',
                  ),
                  Spacer(),
                  NavButton(
                    onPressed: () =>
                        Navigator.pushReplacementNamed(context, ContactPage.id),
                    text: 'Contact',
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    style: kTextButtonStyle,
                    onPressed: () => redirectDiscord(),
                    child: CustomImageIcon('images/discord.png')),
                TextButton(
                    style: kTextButtonStyle,
                    onPressed: () => null,
                    child: CustomImageIcon('images/whatsapp.png')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomImageIcon extends StatelessWidget {
  CustomImageIcon(this.imageName);
  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Image.asset(
        imageName,
        fit: BoxFit.scaleDown,
        height: 30,
      ),
    );
  }
}
