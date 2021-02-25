import 'package:contract_tracing/constants.dart';
import 'package:contract_tracing/screen/login_screen/login_screen.dart';
import 'package:contract_tracing/screen/register_screen/login_details_screen.dart';
import 'package:contract_tracing/states/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileRegisterScreen extends StatelessWidget {
  static const String id = 'register_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProfileForm(),
      ),
    );
  }
}

class ProfileForm extends StatefulWidget {
  const ProfileForm({
    Key key,
  }) : super(key: key);

  @override
  _ProfileFormState createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _recognizer = TapGestureRecognizer();

  String _fullName = "";
  String _contactNumber = "";
  String _address = "";

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerState = Provider.of<RegisterState>(context);

    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: kTextFieldWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BE SAFE\nREGISTER NOW!',
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(height: 1.5),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Personal Information',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 42.0,
                ),
              ],
            ),
          ),
          Container(
            width: kTextFieldWidth,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _fullName = value;
                });
              },
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.person), hintText: 'Full Name'),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            width: kTextFieldWidth,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _contactNumber = value;
                });
              },
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.phone), hintText: 'Contact Number'),
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Container(
            width: kTextFieldWidth,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  _address = value;
                });
              },
              decoration: InputDecoration(
                  suffixIcon: Icon(Icons.location_on),
                  hintText: 'Home Address'),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            width: kTextFieldWidth,
            child: RaisedButton(
              onPressed: () {
                registerState.fullName = _fullName;
                registerState.address = _address;
                registerState.contactNumber = _contactNumber;
                Navigator.pushNamed(context, LoginDetailsScreen.id);
              },
              child: Text(
                'Continue',
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          RichText(
            text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: 'Already have an account?  ',
                  ),
                  TextSpan(
                    recognizer: _recognizer
                      ..onTap =
                          () => Navigator.pushNamed(context, LoginScreen.id),
                    style: TextStyle(color: Colors.pink),
                    text: 'Click here!',
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
