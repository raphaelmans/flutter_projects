import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

const flashOn = 'FLASH ON';
const flashOff = 'FLASH OFF';
const frontCamera = 'FRONT CAMERA';
const backCamera = 'BACK CAMERA';

const yourPlace = 'sample_company';

class ScanScreen extends StatefulWidget {
  static const String id = "scan_screen";
  const ScanScreen({
    Key key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var qrText = '';
  var flashState = flashOn;
  var cameraState = frontCamera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    void toggleFlash() {
      if (controller != null) {
        controller.toggleFlash();
        if (_isFlashOn(flashState)) {
          setState(() {
            flashState = flashOff;
          });
        } else {
          setState(() {
            flashState = flashOn;
          });
        }
      }
    }

    void swapCamera() {
      print(DateTime.now().millisecondsSinceEpoch);
      if (controller != null) {
        controller.flipCamera();
        if (_isBackCamera(cameraState)) {
          setState(() {
            cameraState = frontCamera;
          });
        } else {
          setState(() {
            cameraState = backCamera;
          });
        }
      }
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Theme.of(context).colorScheme.primary,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    qrText + "\n",
                    style: Theme.of(context)
                        .textTheme
                        .overline
                        .copyWith(height: 1.3),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: toggleFlash,
                          icon: Icon( flashState ==  flashOn ? Icons.flash_on : Icons.flash_off),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(8),
                        child: IconButton(
                          onPressed: swapCamera,
                          icon: Icon(cameraState == backCamera ? Icons.camera_rear : Icons.camera_front )
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  bool _isFlashOn(String current) {
    return flashOn == current;
  }

  bool _isBackCamera(String current) {
    return backCamera == current;
  }

  void _onQRViewCreated(QRViewController controller) {
    CollectionReference est =
        FirebaseFirestore.instance.collection('establishments');

    Timestamp scanTime = Timestamp.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch);
    this.controller = controller;
    controller.scannedDataStream.listen((scanData)  {
      if (scanData != null) {
        setState(() {
          qrText = 'Scanned Successfully!';
        });
          DocumentReference userRef = FirebaseFirestore.instance.collection('users').doc(scanData);
        est.doc('sample_company').update({
          'sc_people': FieldValue.arrayUnion([
            {'person': userRef, 'sc_time': scanTime}
          ])
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
