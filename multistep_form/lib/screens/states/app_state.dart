import 'package:flutter/cupertino.dart';
import 'package:multistep_form/screens/country_screen/country_screen.dart';
import 'package:multistep_form/screens/identification_screen/email_screen.dart';
import 'package:multistep_form/screens/password_screen/password_screen.dart';
import 'package:multistep_form/screens/terms_screen/terms_screen.dart';

class AppState with ChangeNotifier {
  int _currentStep = 0;
  int _totalSteps = 4;

  List _listDescription = List();
  AppState() {
    _stateValues.keys.forEach((element) {
      _listDescription.add(_stateValues[element]['stepDescription'].toString());
    });
  }

  bool receivePromo = false;



  var _stateValues = {
    EmailScreen.id: {
      'valueChanged': false,
      'stepDescription': 'Enter your Email',
    },
    PasswordScreen.id: {
      'valueChanged': false,
      'stepDescription': 'Set Password',
    },
    CountryScreen.id: {
      'valueChanged': false,
      'stepDescription': 'Select your Country',
    },
    TermsScreen.id: {
      'valueChanged': false,
      'stepDescription': 'Get Bonus 666 cookies',
    },
  };


  void setStateValue(String screenID, String value){
    print('set: ' +_stateValues[screenID]['stepDescription']);
    _stateValues[screenID]['stepDescription'] = value;
  }

  Map getStateValues(){
    return _stateValues;
  }

  int getCurrentStep() {
    return _currentStep;
  }

  String getStepValueAt(int index) {
    return _listDescription.elementAt(index);
  }

  String getStateValue(String screenID){
    return _stateValues[screenID]['stepDescription'];
  }

  void setStepValue(String value, int index) {
    _listDescription[index] = value;
    notifyListeners();
  }

  void setCurrentStep(int index) {
    _currentStep = index;
  }

  void nextStep() {
    if (_currentStep + 1 < _totalSteps) _currentStep++;
    notifyListeners();
  }

  void prevStep() {
    if (_currentStep > 0) _currentStep--;
    notifyListeners();
  }

  void skipToStep(int step) {
    _currentStep = step;
    notifyListeners();
  }

  String getCurrentRoute(int index) {
    var routes = [EmailScreen.id, PasswordScreen.id];
    return routes.elementAt(index);
  }

  int getStepByName(String routeName) {
    var routes = [EmailScreen.id, PasswordScreen.id];
    return routes.indexOf(routeName);
  }

  Widget getScreenByIndex(int index) {
    if(index >= _stateValues.length)
      return null;
    List<Widget> screen = [EmailScreen(), PasswordScreen(), CountryScreen(),TermsScreen()];
    return screen.elementAt(index);
  }

  List getAllSteps() {
    return _listDescription;
  }

  void notifyListeners(){
    super.notifyListeners();
  }

  void setValueChanged(String screenID, bool value){
    _stateValues[screenID]['valueChanged'] = value;
  }

  bool getValueChanged(String screenID){
    return getStateValues()[screenID]['valueChanged'];
  }
}
