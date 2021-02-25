
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contract_tracing/constants.dart';
import 'package:contract_tracing/screen/home_screen/home_screen.dart';
import 'package:contract_tracing/states/register_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginDetailsScreen extends StatelessWidget {
  static const String id = 'login_details_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoginDetailsForm(),
      ),
    );
  }
}


class LoginDetailsForm extends StatefulWidget {
  @override
  _LoginDetailsFormState createState() => _LoginDetailsFormState();
}

class _LoginDetailsFormState extends State<LoginDetailsForm> {

  String _emailAddress = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {

    final registerState = Provider.of<RegisterState>(context);
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addPersonalInformation(String uid){
      return users.doc(uid).set({
        "address": registerState.address,
        "contactNumber": registerState.contactNumber,
        "fullName": registerState.fullName,
      });
    }


    return Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: kTextFieldWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login Details', style: Theme
                      .of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.normal),),
                  SizedBox(height: 42.0,),
                ],
              ),
            ),
            Container(
              width: kTextFieldWidth,
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    _emailAddress = value;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    hintText: 'Email'),
              ),
            ),
            SizedBox(height: 25.0,),
            Container(
              width: kTextFieldWidth,
              child: TextFormField(
                onChanged: (value){
                  setState(() {
                    _password = value;
                  });
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Password'),
              ),
            ),

            SizedBox(height: 30,),
            Container(
              width: kTextFieldWidth,
              child: RaisedButton(onPressed: ()  async{

                registerState.emailAddress = _emailAddress;
                registerState.password = _password;
                UserCredential userCredential;
                try {
                   userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailAddress,
                      password: _password,
                  );
                } on FirebaseAuthException catch (e) {
                 if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  }
                } catch (e) {
                  print(e);
                }

                if(userCredential != null){
                  await addPersonalInformation(userCredential.user.uid);
                  Navigator.pushNamedAndRemoveUntil(context, HomeScreen.id,(_) => false);
                }
              },
                child: Text('Register', style: Theme
                    .of(context)
                    .textTheme
                    .button,),),
            ),
            SizedBox(height: 30,),
            Container(
              width: kTextFieldWidth,
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap:(){
                  Navigator.pop(context);
                },
                child: Icon(
                    Icons.arrow_back,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            )

          ],
        ),
      );
    }
  }


