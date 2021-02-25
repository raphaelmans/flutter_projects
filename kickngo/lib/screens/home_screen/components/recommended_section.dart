import 'package:flutter/material.dart';
import 'package:kickngo/constants.dart';
import 'package:kickngo/screens/home_screen/trendy_place.dart';

List trendyPlaceList = [
  TrendyPlace(
      location: 'Logon,\nMalapascua',
      image: AssetImage(
        'assets/images/malapscua_beach.jpg',
      )),
  TrendyPlace(
      location: 'Yahay FoodPark,\nTalisay',
      image: AssetImage(
        'assets/images/yahay_foodpark.jpg',
      )),
  TrendyPlace(
      location: "Shangri-La's,\nMactan",
      image: AssetImage(
        'assets/images/hotel_mactan.jpg',
      )),
];

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended',
            style: kHeadingTextStyle,
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: trendyPlaceList.map((place) {
                  return RecommendedPlace(
                    location: place.location,
                    image: place.image,
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RecommendedPlace extends StatelessWidget {
  const RecommendedPlace({
    Key key,
    @required this.image,
    this.location,
  }) : super(key: key);

  final ImageProvider image;
  final String location;

  @override
  Widget build(BuildContext context) {
    //TODO: CHANGE FLATBUTTON
    return GestureDetector(
      onTap: () => print('test'),
      child: Padding(
        padding:  EdgeInsets.only(right: 18.0),
        child: Container(
          height: 190,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: image,
              )),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(12.0),
          child: Text(
            location,
            style: TextStyle(
              color: Color(0xffF7FFF7),
            ),
          ),
        ),
      ),
    );
  }
}
