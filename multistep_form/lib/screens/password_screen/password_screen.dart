import 'package:flutter/material.dart';
import 'package:multistep_form/components/app_textfield.dart';
import 'package:multistep_form/components/app_title.dart';
import 'package:multistep_form/components/body.dart';
import 'package:multistep_form/components/my_stepper.dart';
import 'package:multistep_form/constants.dart';
import 'package:multistep_form/screens/states/app_state.dart';
import 'package:provider/provider.dart';

import 'components/password_validator.dart';
import 'helper_functions.dart';





class PasswordScreen extends StatelessWidget {
  static const String id = 'password_screen';

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    void onSubmit(value){
      appState.setValueChanged(PasswordScreen.id, true);
      String obscureValue = '*' * value.length;
      appState.setStepValue(obscureValue, 1);
      appState.setStateValue(PasswordScreen.id, value);
    }


    return Body(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 26.0, horizontal: kHorizontalPadding),
            child: Column(
              children: [
                AppTitle(),
                AppTextField(
                  index: 1,
                  text: "Password",
                  inputValidator: inputValidator,
                  obscureText: true,
                  onSubmit:onSubmit,
                ),
                SizedBox(height: 12.0,),
                PasswordValidator()
              ],
            ),
          ),
          Expanded(child: MyStepper()),
        ],
      ),
    );
  }
}
