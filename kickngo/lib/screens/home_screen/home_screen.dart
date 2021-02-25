import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kickngo/constants.dart';
import 'package:kickngo/screens/home_screen/components/bottom_navbar.dart';
import 'components/drawer_button.dart';
import 'body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        titleSpacing: 0,
        title: CustomAppBar(),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(child: Body()),
      bottomNavigationBar: BottomNavBar(),
      drawer: Container(
        color: Color(0xffedf2fb),
        width: 250,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 100,
              ),
              Icon(
                Icons.location_on,
                color: Color(0xffB6CCFE),
              ),
              Text(
                'Philippines, Cebu',
                style: TextStyle(
                  color: kPrimaryTextColor,
                ),
              ),
            ],
          ),
          Positioned(
            left: 32.0,
            child: DrawerButton(),
          ),
        ],
      ),
    );
  }
}
