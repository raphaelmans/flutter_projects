import 'package:flutter/material.dart';
import 'package:multistep_form/components/route_transition.dart';
import 'package:multistep_form/constants.dart';
import 'package:multistep_form/screens/states/app_state.dart';
import 'package:multistep_form/screens/successful_screen/successful_screen.dart';
import 'package:provider/provider.dart';

class FormBottomSheet extends StatelessWidget {
  const FormBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    int currentStep = appState.getCurrentStep();
    String screenID = appState.getStateValues().keys.elementAt(currentStep);
    bool valueChanged = appState.getValueChanged(screenID);
    String bottomText = appState.getStepValueAt(currentStep);

    return RaisedButton(
      padding: EdgeInsets.all(0.0),
      onPressed: () {
        bool isAllValidated = true;
        if (screenID == appState.getStateValues().keys.last) {
          bottomText = 'I Agree';

          appState.getStateValues().keys.forEach((element) {
            isAllValidated = appState.getValueChanged(element);
          });

          Navigator.of(context).push(createRoute(SuccessfulScreen()));
        } else {
          Widget renderWidget = appState.getScreenByIndex(currentStep + 1);
          Navigator.of(context).pushReplacement(createRoute(renderWidget));
          appState.nextStep();
        }
      },
      child: Container(
        alignment: Alignment.center,
        color: valueChanged ? kPrimaryColor : Colors.grey,
        child: valueChanged
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tap to continue ',
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_right_alt,
                    color: Colors.white,
                  ),
                ],
              )
            : Text(
                bottomText,
                style: Theme.of(context).textTheme.button.copyWith(
                      color: Colors.white,
                    ),
              ),
        height: 80,
      ),
    );
  }
}
