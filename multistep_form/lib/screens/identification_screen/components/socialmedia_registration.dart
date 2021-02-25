import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialMediaRegistration extends StatelessWidget {
  const SocialMediaRegistration({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Text('with social media'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SocialAvatar(
                icon: Icon(FontAwesomeIcons.facebookF),
              ),
              SocialAvatar(
                icon: Icon(FontAwesomeIcons.twitter),
              ),
              SocialAvatar(
                icon: Icon(FontAwesomeIcons.google),
              ),
              SocialAvatar(
                icon: Icon(FontAwesomeIcons.pinterestP),
              ),
            ],
          ),
          Text('or'),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class SocialAvatar extends StatelessWidget {
  final Icon icon;
  SocialAvatar({this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Color(0xfF51917),
        radius: 25.0,
        child: IconButton(
          icon: icon,
          onPressed: () => null,
          color: Color(0xff6B1A1B),
          padding: EdgeInsets.all(8.0),
        ),
      ),
    );
  }
}
