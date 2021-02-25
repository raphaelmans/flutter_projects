import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multistep_form/screens/states/app_state.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class EmailRegistrationWidget extends StatefulWidget {
  @override
  _EmailRegistrationWidgetState createState() => _EmailRegistrationWidgetState();
}

class _EmailRegistrationWidgetState extends State<EmailRegistrationWidget> {
  FocusNode _inputNode;
  Color _labelColor = kGrayColor;
  Color _nextStepColor = kGrayColor;
  String inputValue = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inputNode = FocusNode();
    _inputNode.addListener(() {
      setState(() {
        _labelColor = _inputNode.hasFocus ? Color(0xffBA876E) : kGrayColor;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _inputNode.dispose();
    super.dispose();
  }

  void _requestFocus() {
    setState(() {
      _inputNode.requestFocus();
    });
  }
  @override
  Widget build(BuildContext context) {

    return  Consumer<AppState>(
      builder:(_,appState,__)=> Row(
        children: [
          Expanded(
            child: Container(
              child: TextFormField(
                  onChanged: (newValue){
                    setState(() {
                      inputValue = newValue;
                      if(newValue.contains("@"))
                        setState(() {
                          _nextStepColor = kPrimaryColor;
                        });
                      else
                        setState(() {
                          _nextStepColor = kGrayColor;
                        });
                    });
                  },
                  cursorColor: _labelColor,
                  onTap: _requestFocus,
                  focusNode: _inputNode,
                  decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: _labelColor,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _labelColor,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: kGrayColor,
                          ))),
                ),
              ),
            ),
          Container(
            height: 60.0,
            child: RaisedButton(
              color: _nextStepColor,
              onPressed: (){
                appState.setStepValue(inputValue, 0);
              },
              child: Icon(FontAwesomeIcons.arrowRight,
                color: Colors.white,)
              ,),
          )
        ],
      ),
    );
  }
}
