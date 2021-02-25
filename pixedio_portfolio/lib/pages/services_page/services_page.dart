import 'package:flutter/material.dart';
import 'package:pixedio_works/components/bordered_text.dart';
import 'package:pixedio_works/components/container_designed.dart';
import 'package:pixedio_works/components/header_nav.dart';
import 'package:pixedio_works/helper_functions/helper_functions.dart';
import 'package:pixedio_works/pages/contacts_page/contacts_page.dart';
import 'package:pixedio_works/pages/home_page/sections/footer.dart';

Text headTextStyle(text, size) {
  return Text(
    text,
    style: TextStyle(fontSize: headingTextSize(size.width)),
  );
}

Text contentTextStyle(text, size) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(
      height: 2.0,
    ),
  );
}

Text actionTextStyle(text, size) {
  return Text(
    text,
    style: TextStyle(fontWeight: FontWeight.bold),
  );
}

TextButton startButton(
  String text, {
  VoidCallback onPressed,
  EdgeInsets padding,
  TextStyle style,
  size,
}) {
  return TextButton(
    style: ButtonStyle(
      foregroundColor:
          MaterialStateProperty.resolveWith((states) => Colors.black),
      overlayColor:
          MaterialStateProperty.resolveWith((states) => Colors.transparent),
    ),
    onPressed: onPressed,
    child: Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: Container(
        child: Padding(
          padding: padding,
          child: Text(
            text,
            style:
                style ?? TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
                style: BorderStyle.solid, color: Colors.black, width: 2.0),
            right: BorderSide(
                style: BorderStyle.solid, color: Colors.black, width: 2.0),
          ),
        ),
      ),
    ),
  );
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({Key key}) : super(key: key);
  static const String id = 'services_page';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final changeLayout = size.width <= 1076;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 15.0),
              ContainerDesigned(
                height: size.height,
                width: size.width,
                child: changeLayout ? _mobileLayout() : _desktopLayout(),
              ),
              Footer(),
            ]),
          ),
          HeaderNav(),
        ],
      ),
    );
  }

  _desktopLayout() {
    return Column(
      children: [
        SizedBox(height: 100.0),
        BorderedText('SERVICES'),
        SizedBox(height: 100.0),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //DESIGN
            ServiceItem(
              headText: 'DESIGN',
              contentText:
                  'Get dyanmic and engaging designs made for your\nnext website, app, webapp, or platform. Let us bring\n your idea to life.',
              onPressed: () => null,
            ),

            ServiceItem(
                headText: 'WEBSITES',
                contentText:
                    'Build an online presence for your business with our\nhigh quality responsive websites, designed to help\ngrow your business.',
                onPressed: () => null),

            ServiceItem(
                headText: 'WEBAPP',
                contentText:
                    'Dont worry about website uptime, security, or\nbandwidth. With our hosting services, we will\nmaintain your website and host it for you.',
                onPressed: () => null)
          ],
        )
      ],
    );
  }

  _mobileLayout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          BorderedText('SERVICES'),
          SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //DESIGN
              ServiceItem(
                headText: 'DESIGN',
                contentText:
                    'Get dyanmic and engaging designs made for your\nnext website, app, webapp, or platform. Let us bring\n your idea to life.',
                onPressed: () => null,
              ),
              SizedBox(
                height: 75,
              ),
              ServiceItem(
                  headText: 'WEBSITES',
                  contentText:
                      'Build an online presence for your business with our\nhigh quality responsive websites, designed to help\ngrow your business.',
                  onPressed: () => null),
              SizedBox(
                height: 75,
              ),
              ServiceItem(
                  headText: 'WEBAPP',
                  contentText:
                      'Dont worry about website uptime, security, or\nbandwidth. With our hosting services, we will\nmaintain your website and host it for you.',
                  onPressed: () => null),
            ],
          )
        ],
      ),
    );
  }
}

class ServiceItem extends StatelessWidget {
  const ServiceItem(
      {Key key,
      @required this.headText,
      @required this.contentText,
      @required this.onPressed})
      : super(key: key);
  final String headText;
  final String contentText;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Container(
      width: 350,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          headTextStyle(headText, size),
          SizedBox(height: 50),
          contentTextStyle(contentText, size),
          SizedBox(height: 25),
          startButton('GET STARTED',
              onPressed: () => Navigator.pushNamed(context, ContactPage.id),
              style: TextStyle(
                fontSize: size.width < 420 ? 10.0 : 14.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Montserrat',
              ),
              padding: size.width <= 420
                  ? EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 15.0,
                    )
                  : EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 42.0,
                    )),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  const CustomText(
    this.text, {
    Key key,
  }) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 60.0,
        right: 60.0,
        top: 20.0,
        bottom: 20.0,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 5.0,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 25,
          fontFamily: 'galderglynn_titling_rg',
        ),
      ),
    );
  }
}
