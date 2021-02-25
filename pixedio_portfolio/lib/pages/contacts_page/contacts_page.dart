import 'package:flutter/material.dart';
import 'package:pixedio_works/components/container_designed.dart';
import 'package:pixedio_works/components/header_nav.dart';
import 'package:pixedio_works/helper_functions/helper_functions.dart';
import 'package:pixedio_works/pages/home_page/sections/footer.dart';

import '../../constants.dart';

class ContactPage extends StatelessWidget {
  static const String id = "contacts_page";
  const ContactPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Scaffold(
      body: Stack(children: [
        ContainerDesigned(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  height: size.height <= 800 ? size.height + 180 : size.height,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(
                        'Contact',
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.black,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: bodyFontSize(size.width),
                              height: 1.6,
                              color: Colors.black),
                          children: [
                            TextSpan(
                                text:
                                    "Want to get in touch ? Drop me a message below or at\n"),
                            TextSpan(
                                text: "pixediodesigns@gmail.com ",
                                style: TextStyle(
                                    decoration: TextDecoration.underline)),
                            TextSpan(text: "or hit me up on discord and more!"),
                          ],
                        ),
                      ),
                      SizedBox(height: size.height * .05),
                      ContactForm(),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Footer(),
              ],
            ),
          ),
        ),
        HeaderNav(),
      ]),
    );
  }
}

class ContactForm extends StatefulWidget {
  ContactForm({Key key}) : super(key: key);

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomTextField(hintText: 'ENTER YOUR NAME*'),
          CustomTextField(
            hintText: 'ENTER YOUR EMAIL*',
            keyboardType: TextInputType.emailAddress,
          ),
          CustomTextField(
            hintText: 'PHONE NUMBER',
            keyboardType: TextInputType.number,
          ),
          CustomTextArea(
            hintText: 'MESSAGE',
          ),
          SubmitContactForm(),
        ],
      ),
    );
  }
}

enum customKeyType { email, number }

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);
  final hintText;
  final bool isPassword;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
                style: BorderStyle.solid, color: Colors.black, width: 3.0),
            bottom: BorderSide(
                style: BorderStyle.solid, color: Colors.black, width: 3.0),
          ),
        ),
        width: getInputWidth(MediaQuery.of(context).size),
        child: TextFormField(
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12.0,
              fontWeight: FontWeight.w700),
          obscureText: isPassword,
          keyboardType: keyboardType,
          cursorHeight: 20.0,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextArea extends StatelessWidget {
  const CustomTextArea({Key key, this.hintText}) : super(key: key);
  final hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
                style: BorderStyle.solid, color: Colors.black, width: 3.0),
            bottom: BorderSide(
                style: BorderStyle.solid, color: Colors.black, width: 3.0),
          ),
        ),
        width: getInputWidth(MediaQuery.of(context).size),
        child: TextFormField(
          style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w700),
          minLines: 5,
          maxLines: 5,
          cursorHeight: 20.0,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class SubmitContactForm extends StatelessWidget {
  const SubmitContactForm({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    return Container(
      width: double.infinity,
      child: Stack(children: [
        Center(
          child: TextButton(
            style: kTextButtonStyle,
            onPressed: () => null,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 42.0,
                  ),
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontFamily: 'Montserrat'),
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.black,
                        width: 2.0),
                    right: BorderSide(
                        style: BorderStyle.solid,
                        color: Colors.black,
                        width: 2.0),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.width <= 800 ? 0 : 25,
          right: size.width <= 800 ? 0 : 25,
          child: size.width <= 800
              ? Column(
                  children: [
                    TextButton(
                        style: kTextButtonStyle,
                        onPressed: () => redirectDiscord(),
                        child: CustomImageIcon('images/discord.png')),
                    SizedBox(height: 10.0),
                    TextButton(
                        style: kTextButtonStyle,
                        onPressed: () => null,
                        child: CustomImageIcon('images/whatsapp.png')),
                  ],
                )
              : Row(
                  children: [
                    TextButton(
                        style: kTextButtonStyle,
                        onPressed: () => redirectDiscord(),
                        child: CustomImageIcon('images/discord.png')),
                    TextButton(
                        style: kTextButtonStyle,
                        onPressed: () => null,
                        child: CustomImageIcon('images/whatsapp.png')),
                  ],
                ),
        ),
      ]),
    );
  }
}
