import 'package:contract_tracing/screen/home_screen/home_screen.dart';
import 'package:contract_tracing/screen/location_screen/location_screen.dart';
import 'package:contract_tracing/screen/login_screen/login_screen.dart';
import 'package:contract_tracing/screen/people_scanned_screen/people_scanned_screen.dart';
import 'package:contract_tracing/screen/register_screen/login_details_screen.dart';
import 'package:contract_tracing/screen/register_screen/register_screen.dart';
import 'package:contract_tracing/screen/scan_screen/scan_screen.dart';
import 'package:contract_tracing/states/register_state.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => RegisterState()),
  ], child: EmpathyApp()));
}

RegisterState registerState = RegisterState();

class EmpathyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Tracing',
      initialRoute: LoginScreen.id,
      routes: {
        LocationScreen.id: (context) => LocationScreen(),
        ScanScreen.id: (context) => ScanScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        PeopleScannedScreen.id: (context) => PeopleScannedScreen(),
        ProfileRegisterScreen.id: (context) =>
            ChangeNotifierProvider<RegisterState>(
                create: (_) => registerState, child: ProfileRegisterScreen()),
        LoginDetailsScreen.id: (context) =>
            ChangeNotifierProvider<RegisterState>.value(
                value: registerState, child: LoginDetailsScreen()),
      },
    );
  }
}
