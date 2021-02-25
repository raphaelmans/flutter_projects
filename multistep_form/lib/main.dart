import 'package:flutter/material.dart';
import 'package:multistep_form/screens/country_screen/country_screen.dart';
import 'package:multistep_form/screens/password_screen/password_screen.dart';
import 'package:multistep_form/screens/states/app_state.dart';
import 'package:multistep_form/screens/successful_screen/successful_screen.dart';
import 'package:multistep_form/screens/terms_screen/terms_screen.dart';
import 'package:provider/provider.dart';
import 'screens/identification_screen/email_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => AppState(),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Color(0xffBA876E),
              inputDecorationTheme: InputDecorationTheme(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffBA876E),
                  ),
                ),
              )),
          title: 'MultiStep Form',
          initialRoute: EmailScreen.id,
          routes: {
            EmailScreen.id: (context) => EmailScreen(),
            PasswordScreen.id: (context) => PasswordScreen(),
            CountryScreen.id: (context) => CountryScreen(),
            TermsScreen.id: (context) => TermsScreen(),
            SuccessfulScreen.id: (context) => SuccessfulScreen(),
          },
        ));
  }
}
