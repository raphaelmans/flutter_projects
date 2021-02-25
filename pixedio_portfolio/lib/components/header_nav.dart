import 'package:flutter/material.dart';
import 'package:pixedio_works/components/container_designed.dart';
import 'package:pixedio_works/helper_functions/helper_functions.dart';
import 'package:pixedio_works/pages/about_page/about_page.dart';
import 'package:pixedio_works/pages/contacts_page/contacts_page.dart';
import 'package:pixedio_works/pages/home_page/home_page.dart';
import 'package:pixedio_works/pages/portfolio_page/portfolio_page.dart';
import 'package:pixedio_works/pages/services_page/services_page.dart';

import '../constants.dart';
import 'nav_button.dart';

class HeaderNav extends StatelessWidget {
  const HeaderNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);

    //To change header background, change ContainerDesigned background
    return ContainerDesigned(
      hasCircle: false,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: size.width <= 620 ? 10.0 : 100.0,
          vertical: 25.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PersonalBrand(),
            size.width <= 840
                ? DropdownNav()
                : Container(
                    width: 300,
                    child: Row(
                      children: [
                        NavButton(
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, AboutPage.id),
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
                          onPressed: () => Navigator.pushReplacementNamed(
                              context, ContactPage.id),
                          text: 'Contact',
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

const kPopStyleText = TextStyle(fontSize: 10.0, color: Colors.black);

class DropdownNav extends StatelessWidget {
  const DropdownNav({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.menu),
      color: Colors.white,
      itemBuilder: (context) => [
        PopupMenuItem(
          textStyle: kPopStyleText,
          child: PopUpNavButton(
            onPressed: () => Navigator.pushNamed(context, AboutPage.id),
            text: 'About',
          ),
        ),
        PopupMenuItem(
          textStyle: kPopStyleText,
          child: PopUpNavButton(
            onPressed: () => Navigator.pushNamed(context, PortfolioPage.id),
            text: 'Portfolio',
          ),
        ),
        PopupMenuItem(
          textStyle: kPopStyleText,
          child: PopUpNavButton(
            onPressed: () => Navigator.pushNamed(context, ServicesPage.id),
            text: 'Services',
          ),
        ),
        PopupMenuItem(
          textStyle: kPopStyleText,
          child: PopUpNavButton(
            onPressed: () => Navigator.pushNamed(context, ContactPage.id),
            text: 'Contact',
          ),
        ),
      ],
    );
  }
}

class PopUpNavButton extends StatelessWidget {
  const PopUpNavButton({Key key, @required this.onPressed, @required this.text})
      : super(key: key);
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style: kPopStyleText.copyWith(color: Colors.black),
        ),
      ),
    );
  }
}

class PersonalBrand extends StatelessWidget {
  const PersonalBrand({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: kTextButtonStyle,
          onPressed: () =>
              Navigator.pushReplacementNamed(context, MyHomePage.id),
          child: Text(
            'Pixedio - ',
            style: TextStyle(
                fontSize: size.width < 420 ? 24.0 : 36.0,
                fontFamily: 'Cervanttis'),
          ),
        ),
        Text(
          'Design and Dev',
          style: TextStyle(
              fontSize: size.width < 420 ? 18 : 28.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w100),
        ),
      ],
    );
  }
}
