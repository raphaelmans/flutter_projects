import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multistep_form/constants.dart';
import 'package:multistep_form/screens/identification_screen/email_screen.dart';
import 'package:multistep_form/screens/states/app_state.dart';
import 'package:provider/provider.dart';

class AppTextField extends StatefulWidget {
  final String text;
  final Function inputValidator;
  final bool obscureText;
  final Function onSubmit;
  final int index;

  const AppTextField(
      {Key key,
      @required this.text,
      @required this.inputValidator,
      this.obscureText = false,
      @required this.onSubmit,
      this.index = 0})
      : super(key: key);

  @override
  _AppTextFieldWidgetState createState() => _AppTextFieldWidgetState();
}

class _AppTextFieldWidgetState extends State<AppTextField> {
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
    final appState = Provider.of<AppState>(context, listen: false);
    return Row(
      children: [
        Expanded(
          child: Container(
            child: TextFormField(
              obscureText: widget.obscureText,
              initialValue: appState.getCurrentStep() == 0 &&
                      appState.getValueChanged(EmailScreen.id)
                  ? appState.getStepValueAt(0)
                  : '',
              onChanged: (newValue) {
                setState(() {
                  inputValue = newValue;
                  if (widget.inputValidator(newValue))
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
                hintText: widget.text,
                labelText: widget.text,
                labelStyle: TextStyle(
                  color: _labelColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _labelColor,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kGrayColor,
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 60.0,
          child: RaisedButton(
            color: _nextStepColor,
            onPressed: () {
              if (widget.inputValidator(inputValue))
                widget.onSubmit(inputValue);
            },
            child: Icon(
              FontAwesomeIcons.arrowRight,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }
}
