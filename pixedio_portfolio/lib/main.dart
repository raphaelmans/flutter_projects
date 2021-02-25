import 'package:flutter/material.dart';
import 'package:pixedio_works/pages/contacts_page/contacts_page.dart';
import 'package:pixedio_works/pages/portfolio_page/portfolio_page.dart';
import 'helper_functions/helper_functions.dart';
import 'pages/about_page/about_page.dart';
import 'pages/services_page/services_page.dart';

import 'pages/home_page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pixedio - My Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.id,
      routes: {
        MyHomePage.id: (context) =>
            MyHomePage(orientation: getContextOrientation(context)),
        AboutPage.id: (context) => AboutPage(),
        ServicesPage.id: (context) => ServicesPage(),
        PortfolioPage.id: (context) => PortfolioPage(),
        ContactPage.id: (context) => ContactPage(),
      },
    );
  }
}
