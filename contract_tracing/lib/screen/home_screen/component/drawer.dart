import 'package:contract_tracing/screen/home_screen/home_screen.dart';
import 'package:contract_tracing/screen/location_screen/location_screen.dart';
import 'package:contract_tracing/screen/login_screen/login_screen.dart';
import 'package:contract_tracing/screen/people_scanned_screen/people_scanned_screen.dart';
import 'package:contract_tracing/screen/scan_screen/scan_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.only(top: 42),
        children: <Widget>[
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.id);
            },
            leading: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.error,
              size: Theme.of(context).textTheme.headline5.fontSize,
            ),
            title: Text(
              'Home',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, LoginScreen.id);
            },
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.error,
              size: Theme.of(context).textTheme.headline5.fontSize,
            ),
            title: Text(
              'Logout',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, LocationScreen.id);
            },
            leading: Icon(
              Icons.place,
              color: Theme.of(context).colorScheme.error,
              size: Theme.of(context).textTheme.headline5.fontSize,
            ),
            title: Text(
              'Your Place',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, ScanScreen.id);
            },
            leading: Icon(
              Icons.qr_code_scanner,
              color: Theme.of(context).colorScheme.error,
              size: Theme.of(context).textTheme.headline5.fontSize,
            ),
            title: Text(
              'Scan Others',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, PeopleScannedScreen.id);
            },
            leading: Icon(
              Icons.people,
              color: Theme.of(context).colorScheme.error,
              size: Theme.of(context).textTheme.headline5.fontSize,
            ),
            title: Text(
              'View People',
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      ),
    );
  }
}
