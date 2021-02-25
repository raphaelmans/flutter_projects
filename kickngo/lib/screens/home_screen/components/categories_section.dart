import 'package:flutter/material.dart';
import 'package:kickngo/constants.dart';
import 'package:kickngo/presentation/app_icons.dart';
import 'package:kickngo/screens/beach_screen/beach_screen.dart';

class CategoriesSection extends StatefulWidget {
  @override
  _CategoriesSectionState createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  String currentActive;

  void setActive(text) {
    setState(() {
      if (currentActive == text)
        currentActive = null;
      else {
        switch (text) {
          case 'Beach':
            currentActive = text;
            Future.delayed(Duration(milliseconds: 250)).then((_) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BeachScreen()),
              ).then(
                    (value) => setState(() {
                  currentActive = "";
                }),
              );
            });
            break;
          default:
            currentActive = text;
            break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Category', style: kHeadingTextStyle),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Hero(
                    tag: 'Beach',
                    child: CategoryButton(
                      text: 'Beach',
                      icon: Icon(
                        AppIcons.beach,
                      ),
                      circleColor: Color(0xff24A3B7),
                      isActive: 'Beach' == currentActive,
                      press: setActive,
                    ),
                  ),
                  CategoryButton(
                    text: 'Food',
                    icon: Icon(
                      AppIcons.food,
                    ),
                    circleColor: Color(0xffFF6B6B),
                    isActive: 'Food' == currentActive,
                    press: setActive,
                  ),
                  CategoryButton(
                    text: 'Hotel',
                    icon: Icon(
                      AppIcons.hotel,
                    ),
                    circleColor: Color(0xffDCC96D),
                    isActive: 'Hotel' == currentActive,
                    press: setActive,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  CategoryButton({
    Key key,
    @required this.text,
    @required this.icon,
    @required this.circleColor,
    this.isActive = false,
    this.press,
  }) : super(key: key);

  final bool isActive;
  final String text;
  final Widget icon;
  final Color circleColor;
  final Function press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        press(text);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 1000),
        height: isActive ? 90 : 130,
        curve: Curves.elasticOut,
        width: 70,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CircleAvatar(
                  backgroundColor: circleColor,
                  radius: 28.0,
                  child: IconTheme(
                      data: IconThemeData(
                        color: Colors.white,
                      ),
                      child: icon),
                ),
              ),
              isActive
                  ? SizedBox.shrink()
                  : Expanded(
                      child: Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        text,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(color: kPrimaryTextColor),
                      ),
                    )),
            ],
          ),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: kCBorderColor,
              width: isActive ? 0.0 : 1.0,
            )),
      ),
    );
  }
}
