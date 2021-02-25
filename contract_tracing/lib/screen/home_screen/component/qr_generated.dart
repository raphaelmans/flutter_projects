import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRGenerated extends StatefulWidget {
  @override
  _QRGeneratedState createState() => _QRGeneratedState();
}

class _QRGeneratedState extends State<QRGenerated> {
  String _uid;

  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        setState(() {
          _uid = user.uid;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(_uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text('Loading'),
            );

          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Column(
                children: [
                  QrImage(
                    data: _uid,
                    version: QrVersions.auto,
                    size: 200.0,
                  )
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
