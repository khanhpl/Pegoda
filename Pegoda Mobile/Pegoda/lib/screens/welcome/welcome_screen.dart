import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pegoda/controllers/customer_main.dart';
import 'package:pegoda/screens/welcome/register_screen.dart';
import 'package:pegoda/screens/welcome/sign_up_widget.dart';
import '../../MyLib/constants.dart' as Constants;
import '../../MyLib/globals.dart' as Globals;
import '../../MyLib/repository/login_api.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String token = "";

  // final Stream<dynamic> _stream = (() async* {
  //   FirebaseAuth.instance.authStateChanges();
  //   final user = FirebaseAuth.instance.currentUser!;
  // })();

  @override
  Widget build(BuildContext context) =>
      Material(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              // final user = FirebaseAuth.instance.currentUser!.getIdToken()
              //     .then((value) => Globals.firebaseToken = value.toString());
              // user
              //     .getIdToken()
              //     .then((value) => Globals.firebaseToken = value.toString());

              // checkCurExistedUser(Globals.firebaseToken);
              //test
              // final user = FirebaseAuth.instance.currentUser!
              //     .getIdToken()
              //     .then((value) =>
              //     {LoginApi().checkCurUser(value).then((value) => {
              //     if(value){
              //         CusMain(selectedIndex: 0, isBottomNav: true);
              //     }else{
              //         RegisterScreen();
              //     }
              // })});
              //test
            // final checkCurUser =
            //     LoginApi().checkCurUser(Globals.firebaseToken);
            // bool checkExistedUser;
            // checkCurUser.then((value) => test(value));
              final user = FirebaseAuth.instance.currentUser!.getIdToken().then((value) => Globals.firebaseToken = value);
              final checkCurUser = LoginApi().checkCurUser(Globals.firebaseToken).then((value) => Globals.CheckExistedUser = value);
              if(Globals.CheckExistedUser){
                return CusMain(selectedIndex: 0, isBottomNav: true);
              }else{
                return RegisterScreen();
              }

            return RegisterScreen();
            } else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong!'));
            } else {
            return SignUpWidget();
            }
          },
        ),
      );

  void test(bool value) {
    if (value) {
      print('Đúng nè');
    } else {
      print('Sai nè');
    }
  }

// void checkCurExistedUser(String firebaseToken) async {
//   bool checkCurUser = false;
//   checkCurUser = await LoginApi().checkCurUser(firebaseToken);
//   if (checkCurUser) {
//     Globals.CheckExistedUser = true;
//   } else {
//     Globals.CheckExistedUser = false;
//   }
// }
}
