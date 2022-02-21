import 'package:flutter/material.dart';
import 'package:pegoda/controllers/customer_main.dart';
import 'package:pegoda/screens/customer/cus_account/cus_app_infor_screen.dart';
import 'package:pegoda/screens/customer/cus_account/cus_app_setting_screen.dart';
import 'package:pegoda/screens/customer/cus_account/cus_personal_setting_screen.dart';
import 'package:pegoda/screens/customer/cus_account/order_history_screen.dart';
import 'package:pegoda/screens/customer/cus_main/questions_screen.dart';
import 'package:pegoda/screens/customer/notification/notification_screen.dart';
import 'package:pegoda/screens/customer/search/search_screen.dart';
import 'package:pegoda/screens/welcome/confirm_code_screen.dart';
import 'package:pegoda/screens/welcome/forgot_password_screen.dart';
import 'package:pegoda/screens/welcome/login_screen.dart';
import 'package:pegoda/screens/welcome/set_new_password_screen.dart';
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
        '/cusMain': (context) => CusMain(selectedIndex: 0, isBottomNav: true),
        '/forgotPasswordScreen': (context) => ForgotPasswordScreen(),
        '/confirmCodeScreen': (context) => ConfirmCodeScreen(),
        '/setNewPasswordScreen': (context) => SetNewPasswordScreen(),
        '/searchScreen': (context) => SearchScreen(),
        '/cusAccountScreen': (context) => CusMain(selectedIndex: 3, isBottomNav: false),
        '/petScreen': (context) => CusMain(selectedIndex: 2, isBottomNav: true),
        '/notificationScreen': (context) => CusMain(selectedIndex: 1, isBottomNav: false),
        '/personalSettingScreen': (context) => PersonalSettingScreen(),
        '/orderHistoryScreen': (context) => OrderHistoryScreen(),
        '/appInforScreen': (context) => AppInforScreen(),
        '/appSettingScreen': (context) => AppSettingScreen(),
        '/questionScreen': (context) => QuestionsScreen(),



      },
    ),
  );
}

