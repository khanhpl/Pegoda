import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pegoda/MyLib/models/notification_model.dart';
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

import 'models/local_notification.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

FirebaseMessaging messaging = FirebaseMessaging.instance;
// NotificationModel? _notificationModel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

void registerNotification() async {
  await Firebase.initializeApp();
  messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
      alert: true, badge: true, provisional: false, sound: true);
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("on app");
      NotificationModel notificationModel = NotificationModel(
          title: message.notification!.title,
          body: message.notification!.body,
          dataTitle: message.data['title'],
          dataBody: message.data['body']);

      print("body: ${notificationModel.body}");
      print("title: ${notificationModel.title}");
      _showNotification(notificationModel.title!, notificationModel.body!);
    });
  } else {
    print("not permission");
  }
}

Future<void> _showNotification(String title, String content) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails('your channel id', 'your channel name',
          channelDescription: 'your channel description',
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
          tag: "TWE",
          ticker: 'ticker');

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin
      .show(0, title, content, platformChannelSpecifics, payload: 'item x');
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  String? token = await FirebaseMessaging.instance.getToken();
  print(token);

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    print('message recieved');
    print(event.notification!.body);
  });

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    print('message clicked');
  });

  const initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  const initializationSettingsIOS = IOSInitializationSettings();
  const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //     onSelectNotification: (value) {
  //   Navigator.pushNamed(context, "/notification");
  // });

  registerNotification();

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
            '/registerScreen': (context) => RegisterScreen(),
            '/orderSuccessScreen': (context) => OrderSuccessScreen(),
            '/cancelOrderScreen': (context) => CancelOrderScreen(),
            '/cancelOrderSuccessScreen': (context) =>
                CancelOrderSuccessScreen(),
          },
          // home: WelcomeScreen(),
        ),
      );
}
