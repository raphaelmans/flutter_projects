import 'package:flutter/material.dart';
import 'package:multistep_form/constants.dart';
import 'package:multistep_form/screens/password_screen/helper_functions.dart';
import 'package:multistep_form/screens/password_screen/password_screen.dart';
import 'package:multistep_form/screens/states/app_state.dart';
import 'package:provider/provider.dart';

class PasswordValidator extends StatelessWidget {
  const PasswordValidator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    String passwordValue =
        appState.getStateValues()[PasswordScreen.id]['stepDescription'];

    bool valueChanged = appState.getValueChanged(PasswordScreen.id);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password must contain',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  'lower case' ,
                  style: TextStyle(
                      color:
                          Colors.black),
                )),
                Expanded(child: Text('numbers',style: TextStyle(
                    color:
                         Colors.black),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: Text('upper case',style: TextStyle(
                color:
                     Colors.black),
            )),
                Expanded(child: Text('8 - 16 characters',style: TextStyle(
                    color:
                         Colors.black),)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
