import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: "Name: Raphael Mansueto\n"+"Contact Number: 09282406854\n"+"Address: Mambaling, Cebu City",
      version: QrVersions.auto,
      size: 200.0,
    );
  }
}
