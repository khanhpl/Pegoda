import 'package:flutter/material.dart';
import 'package:pegoda/screens/customer/cus_home_screen.dart';
import 'package:pegoda/screens/pet_care_center/pcc_home_screen.dart';
import 'package:pegoda/screens/welcome/login_screen.dart';
import 'package:pegoda/screens/welcome/welcome_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => WelcomeScreen(),
        '/loginScreen': (context) => LoginScreen(),
        '/cusHomeScreen': (context) => CusHomeScreen(),
        '/pccHomeScreen': (context) => PCCHomeScreen(),
      },
    ),
  );
}

