import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multistep_form/components/route_transition.dart';
import 'package:multistep_form/constants.dart';
import 'package:multistep_form/screens/states/app_state.dart';
import 'package:provider/provider.dart';

const kfirstStepSize = 30.0;
const kdefaultStepSize = 15.0;
const kLastStepSize = 40.0;
const kLineStepLength = 25.0;
const kStepLabelColor = Color(0xff6B1A1B);

const kStepsTextStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.bold,
  color: kStepLabelColor,
);

class MyStepper extends StatefulWidget {
  @override
  _MyStepperState createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    double stepLabelBottomMargin(double circleSize, int index) {
      double containerHeight = circleSize + kLineStepLength;
      if (appState.getCurrentStep() == index) containerHeight += 10;
      return containerHeight;
    }

    double getCircleSize(int index, int listLength) {
      double size = kdefaultStepSize;
      if (index == 0) size = kfirstStepSize;
      if (index == listLength - 1) size = kLastStepSize;
      return size;
    }

    List myStepsList = AppState().getAllSteps();
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.0,vertical: 48.0),
        color: Colors.grey.withOpacity(0.25),
        child: Row(children: [
          Stack(
            overflow: Overflow.visible,
            children: [
              Positioned(
                left: 80.0,
                child: Column(
                  children: List.generate(myStepsList.length, (index) {
                    double circleSize = getCircleSize(index, myStepsList.length);
                    String text = myStepsList.elementAt(index).toString();
                    Widget myText =
                    Container(
                      child: Text(
                        appState.getStepValueAt(index),
                        style: appState.getCurrentStep() != index
                            ? kStepsTextStyle.copyWith(
                            color: kStepLabelColor.withOpacity(0.5))
                            : kStepsTextStyle,
                      ),
                      height: stepLabelBottomMargin(circleSize, index),
                    );
                    if (index == myStepsList.length - 1)
                      myText = Row(children: [
                        Stack(overflow: Overflow.visible, children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 5, 35, 5),
                            color: kPrimaryColor.withOpacity(0.1),
                            child: Text(
                              text,
                              style: kStepsTextStyle.copyWith(
                                  color: kPrimaryColor,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .fontSize),
                            ),
                          ),
                          Positioned(
                            child: Icon(
                              FontAwesomeIcons.gift,
                              color: kPrimaryColor,
                              size: 32.0,
                            ),
                            top: -2.5,
                            right: -5,
                          )
                        ]),
                      ]);
                    return  myText;
                  }),
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ),
              Hero(
                tag: 'stepsHero',
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(myStepsList.length, (index) {
                      Widget item;
                      double circleSize =
                          getCircleSize(index, myStepsList.length);

                      item = MyStep(stepNo: index, size: circleSize);
                      return index != myStepsList.length - 1
                          ? Column(
                              children: [
                                item,
                                StepLine(),
                              ],
                            )
                          : item;
                    })),
              ),

            ],
          ),
        ]),
      ),
    );
  }
}

class StepLine extends StatelessWidget {
  const StepLine({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kLineStepLength,
      width: 2,
      color: Colors.grey.withOpacity(0.8),
    );
  }
}

class MyStep extends StatelessWidget {
  final int stepNo;
  final double size;
  const MyStep({Key key, @required this.stepNo, @required this.size})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    var appState = Provider.of<AppState>(context);

    String screenID = appState.getStateValues().keys.elementAt(stepNo);

    bool valueChanged = appState.getValueChanged(screenID);

    bool isCurrentStep() {
      return appState.getCurrentStep() == stepNo;
    }

    double getCircleSize() {
      return isCurrentStep() ? size + 10 : size;
    }

    return GestureDetector(
      onTap: () {
        if (appState.getCurrentStep() != stepNo) {
          appState.skipToStep(stepNo);

          int currentStep = appState.getCurrentStep();
          Widget renderWidget = appState.getScreenByIndex(currentStep);
          Navigator.of(context).pushReplacement(createRoute(renderWidget));
        }
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        curve: Curves.easeOutCirc,
        height: getCircleSize(),
        width: getCircleSize(),
        decoration: BoxDecoration(
          color: isCurrentStep()
              ? Colors.white
              : valueChanged
                  ? kPrimaryColor
                  : Colors.grey,
          border: Border.all(
            color: isCurrentStep() ? kPrimaryColor : Colors.transparent,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(
            getCircleSize() / 2,
          ),
        ),
        child: valueChanged
            ? Icon(
                FontAwesomeIcons.check,
                size: getCircleSize() / 2,
                color: !isCurrentStep() ? Colors.white : kPrimaryColor,
              )
            : null,
      ),
    );
  }
}
