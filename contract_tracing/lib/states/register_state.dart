
import 'package:flutter/cupertino.dart';

enum states{
  fullName,
  contactNumber,
  address,
  emailAddress,
  password,
}
class RegisterState with ChangeNotifier{



  Map _state = {
    states.fullName: "",
    states.contactNumber:"",
    states.address:"",
    states.emailAddress:"",
    states.password:"",
  };


  Map getStates(){
    return _state;
  }

  set fullName(value){
    _state[states.fullName] = value;
    notifyListeners();
  }
  set contactNumber(value){
    _state[states.contactNumber] = value;
    notifyListeners();
  }
  set address(value){
    _state[states.address] = value;
    notifyListeners();
  }
  set password(value){
    _state[states.password] = value;
    notifyListeners();
  }

  set emailAddress(value){
    _state[states.emailAddress] = value;
    notifyListeners();
  }

  String get fullName{
    return _state[states.fullName];
  }

  String get contactNumber{
    return _state[states.contactNumber];
  }

  String get address{
    return _state[states.address];
  }

  String get emailAddress{
    return _state[states.emailAddress];
  }
  String get password{
    return _state[states.password];
  }

}