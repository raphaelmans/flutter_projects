import 'package:flutter/material.dart';
import 'package:kickngo/constants.dart';

class DiscoverSection extends StatelessWidget {
  const DiscoverSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          image: DecorationImage(
              image: AssetImage('assets/images/discover_image.jpg',),
              fit: BoxFit.cover
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  style: TextStyle(
                    height: 1.4,
                  ),
                  children: [
                    TextSpan(
                      text: "Let's Discover Around\n",
                      style: Theme.of(context).textTheme.headline5.copyWith(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                        text: 'Find the best places to visit',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w200,
                          color: Colors.white,
                        )
                    )
                  ]
              )
          ),
          SizedBox(
            height: 14.0,
          ),
          FlatButton(
            padding: EdgeInsets.symmetric(horizontal: 32.0,vertical: 12.0),
            onPressed: ()=>null,
            color: Color(0xffF7FFF7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text('Start Now',style: TextStyle(
              fontSize:  14.0,
              color: kHeadingColor,
            ),),
          )
        ],
      ),

    );
  }
}
