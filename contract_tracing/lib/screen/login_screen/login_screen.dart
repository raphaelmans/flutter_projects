import 'package:contract_tracing/constants.dart';
import 'package:contract_tracing/screen/home_screen/home_screen.dart';
import 'package:contract_tracing/screen/register_screen/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: LoginForm()),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String emailAddress = "";
  String password = "";

  final _recognizer = TapGestureRecognizer();

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user != null) {
        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id, (_) => false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: kTextFieldWidth,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  emailAddress = value;
                });
              },
              decoration: InputDecoration(hintText: 'Email'),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: kTextFieldWidth,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: kTextFieldWidth,
            child: RaisedButton(
              onPressed: () async {
                UserCredential userCredential;
                try {
                  userCredential = await auth.signInWithEmailAndPassword(
                    email: emailAddress,
                    password: password,
                  );
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                }
                if (userCredential != null)
                  Navigator.pushNamed(context, HomeScreen.id);
              },
              child: Text(
                'Login',
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
                    text: 'Do not have an account? ',
                  ),
                  TextSpan(
                    recognizer: _recognizer
                      ..onTap = () => Navigator.pushReplacementNamed(
                          context, ProfileRegisterScreen.id),
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
