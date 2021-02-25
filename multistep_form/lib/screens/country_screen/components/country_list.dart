import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:multistep_form/screens/country_screen/country_screen.dart';
import 'package:multistep_form/screens/states/app_state.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class MyCountryLists extends StatefulWidget {
  @override
  _MyCountryListsState createState() => _MyCountryListsState();
}

class _MyCountryListsState extends State<MyCountryLists> {
  FocusNode _inputNode;
  Color _labelColor = kGrayColor;
  TextEditingController _textController = TextEditingController();

  String countryPicked = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inputNode = FocusNode();
    _textController.addListener(() {});
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
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context, listen: false);
    return Container(
      height: 60,
      child: TextFormField(
        controller: _textController,
        onTap: () {
          showCountryPicker(
            context: context,
            onSelect: (Country country) {
              setState(() {
                countryPicked = country.displayNameNoCountryCode;
                _textController.text = countryPicked;
              });
              appState.setStepValue(countryPicked, 2);
              appState.setValueChanged(CountryScreen.id, true);
            },
          );
        },
        focusNode: _inputNode,
        readOnly: true,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: _labelColor,
          ),
          hintText: 'Country',
          labelText: 'Country',
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
          suffixIcon: Icon(
            Icons.arrow_drop_down,
            color: kPrimaryColor,
            size: 32,
          ),
        ),
      ),
    );
  }
}
