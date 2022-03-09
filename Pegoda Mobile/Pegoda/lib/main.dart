import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/provider/google_sign_in_provider.dart';
import 'package:pegoda/controllers/customer_main.dart';
import 'package:pegoda/screens/customer/cus_account/cancel_order_screen.dart';
import 'package:pegoda/screens/customer/cus_account/cancel_order_success_screen.dart';
import 'package:pegoda/screens/customer/cus_account/cus_app_infor_screen.dart';
import 'package:pegoda/screens/customer/cus_account/cus_app_setting_screen.dart';
import 'package:pegoda/screens/customer/cus_account/cus_personal_setting_screen.dart';
import 'package:pegoda/screens/customer/cus_account/order_history_screen.dart';
import 'package:pegoda/screens/customer/cus_main/neareast_pcc_screen.dart';
import 'package:pegoda/screens/customer/cus_main/questions_screen.dart';
import 'package:pegoda/screens/customer/pet/add_pet_screen.dart';
import 'package:pegoda/screens/customer/search/order_screen.dart';
import 'package:pegoda/screens/customer/search/order_success_screen.dart';
import 'package:pegoda/screens/customer/search/search_screen.dart';
import 'package:pegoda/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pegoda/screens/welcome/register_screen.dart';
import 'package:pegoda/screens/customer/cus_main/chat_screen.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp(
          initialRoute: '/',
          routes: <String, WidgetBuilder>{
            '/': (context) => WelcomeScreen(),
            '/cusMain': (context) =>
                CusMain(selectedIndex: 0, isBottomNav: true),
            '/searchScreen': (context) => SearchScreen(),
            '/cusAccountScreen': (context) =>
                CusMain(selectedIndex: 3, isBottomNav: false),
            '/petScreen': (context) =>
                CusMain(selectedIndex: 1, isBottomNav: true),
            '/notificationScreen': (context) =>
                CusMain(selectedIndex: 1, isBottomNav: false),
            '/chatScreen': (context) => ChatPage(),
            '/personalSettingScreen': (context) => PersonalSettingScreen(),
            '/orderHistoryScreen': (context) => OrderHistoryScreen(),
            '/appInforScreen': (context) => AppInforScreen(),
            '/appSettingScreen': (context) => AppSettingScreen(),
            '/questionScreen': (context) => QuestionsScreen(),
            '/addPetScreen': (context) => AddPetScreen(),
            '/neareastPCCScreen': (context) => NearestPCCScreen(),
            '/orderScreen': (context) => OrderScreen(),
            '/registerScreen': (context) => RegisterScreen(),
            '/orderSuccessScreen': (context) => OrderSuccessScreen(),
            '/cancelOrderScreen': (context) => CancelOrderScreen(),
            '/cancelOrderSuccessScreen': (context) => CancelOrderSuccessScreen(),
          },
          // home: WelcomeScreen(),
        ),
      );
}
