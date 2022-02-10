import 'package:flutter/material.dart';
import 'package:pegoda/controllers/customer_main.dart';
import 'package:pegoda/controllers/pet_care_center_main.dart';
import 'package:pegoda/screens/customer/cus_main/cus_home_screen.dart';
import 'package:pegoda/screens/pet_care_center/pcc_home_screen.dart';
import 'package:pegoda/screens/welcome/login_screen.dart';
import 'package:pegoda/screens/welcome/welcome_screen.dart';
import 'package:pegoda/screens/welcome/register_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => WelcomeScreen(),
        '/loginScreen': (context) => LoginScreen(),
        '/registerScreen': (context) => RegisterScreen(),
        '/cusHomeScreen': (context) => CusHomeScreen(),
        '/pccHomeScreen': (context) => PCCHomeScreen(),
        '/pccMain': (context) => PCCMain(selectedIndex: 0, isBottomNav: true),
        '/cusMain': (context) => CusMain(selectedIndex: 0, isBottomNav: true),

      },
    ),
  );
}

