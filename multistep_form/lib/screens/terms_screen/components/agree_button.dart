import 'package:flutter/material.dart';
import 'package:multistep_form/constants.dart';
import 'package:multistep_form/screens/states/app_state.dart';
import 'package:multistep_form/screens/terms_screen/terms_screen.dart';
import 'package:provider/provider.dart';

class AgreeButton extends StatefulWidget {
  const AgreeButton({
    Key key,
  }) : super(key: key);

  @override
  _AgreeButtonState createState() => _AgreeButtonState();
}

class _AgreeButtonState extends State<AgreeButton> {

  bool _hasAgreed = false;
  @override
  Widget build(BuildContext context) {

    final appState = Provider.of<AppState>(context);
    return RaisedButton(
      color: _hasAgreed ? kPrimaryColor : kGrayColor,
      onPressed: () {
        setState(() {
          _hasAgreed = !_hasAgreed;
        });
        appState.setValueChanged(TermsScreen.id, _hasAgreed);
        appState.notifyListeners();
      },
      child: Text(
        'I AGREE',
        style: Theme.of(context).textTheme.button.copyWith(color:Colors.white )
      ),
    );
  }
}
