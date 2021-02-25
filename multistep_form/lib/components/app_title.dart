import 'package:flutter/material.dart';
import 'package:multistep_form/components/route_transition.dart';
import 'package:multistep_form/constants.dart';
import 'package:multistep_form/screens/states/app_state.dart';
import 'package:provider/provider.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);


    bool isNotFirstScreen = appState.getCurrentStep() != 0;

    Widget renderThis = isNotFirstScreen ?  Positioned(
      left: 0,
      child: GestureDetector(
        onTap: (){
          appState.prevStep();
          Widget renderWidget = appState.getScreenByIndex(appState.getCurrentStep());
          Navigator.of(context).pushReplacement(createRoute(renderWidget));
        },
        child: Icon(
          Icons.arrow_back,
          color: kGrayColor,
        ),
      ),
    ): SizedBox();

    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Stack(
            children: [
             renderThis,
              Center(
                child: Text(
                  'Simple Registration',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
