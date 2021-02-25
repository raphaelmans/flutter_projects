import 'package:contract_tracing/screen/home_screen/component/drawer.dart';
import 'package:contract_tracing/screen/home_screen/component/qr_generated.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'home_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        automaticallyImplyLeading: false,
        title: Text('Tracing App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Scan me!',
            style: Theme.of(context)
                .textTheme
                .headline3
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          SizedBox(
            height: 25.0,
          ),
          QRGenerated()
        ],
      ),
      drawer: HomeDrawer(),
    );
  }
}
