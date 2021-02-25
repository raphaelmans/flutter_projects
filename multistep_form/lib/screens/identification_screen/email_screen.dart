import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multistep_form/components/app_textfield.dart';
import 'package:multistep_form/components/app_title.dart';
import 'package:multistep_form/components/body.dart';
import 'package:multistep_form/components/my_stepper.dart';
import 'package:multistep_form/constants.dart';

import 'package:multistep_form/screens/identification_screen/components/socialmedia_registration.dart';
import 'package:multistep_form/screens/states/app_state.dart';
import 'package:provider/provider.dart';

class EmailScreen extends StatelessWidget {
  static const String id = 'email_screen';


  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context,listen: false );
    void onSubmit(value){
      appState.setValueChanged(EmailScreen.id, true);
      appState.setStepValue(value, 0);
    }

    bool inputValidator(value){
      if (value.contains('@')) return true;
      return false;
    }

    return Body(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 26.0, horizontal: kHorizontalPadding),
            child: Column(
              children: [
                AppTitle(),
                SocialMediaRegistration(),

                AppTextField(
                  text: "Email",
                  inputValidator: inputValidator,
                  onSubmit: onSubmit,
                ),
                PromoCheckBox(),
              ],
            ),
          ),
          Expanded(child: MyStepper()),
        ],
      ),
    );
  }
}

class PromoCheckBox extends StatefulWidget {
  const PromoCheckBox({
    Key key,
  }) : super(key: key);

  @override
  _PromoCheckBoxState createState() => _PromoCheckBoxState();
}

class _PromoCheckBoxState extends State<PromoCheckBox> {
  bool _isPromo = false;
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    _isPromo = appState.receivePromo;
    return CheckboxListTile(
      value: _isPromo,
      contentPadding: EdgeInsets.all(0),
      controlAffinity: ListTileControlAffinity.leading,
      title: Text('I want to receive a promo emails'),
      onChanged: (newValue) {
        setState(() {
          _isPromo = newValue;
          appState.receivePromo = _isPromo;
        });
      },
      checkColor: Colors.white,
      activeColor: kPrimaryColor,
    );
  }
}
