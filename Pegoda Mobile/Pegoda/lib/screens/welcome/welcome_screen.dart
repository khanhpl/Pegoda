
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/repository/login_api.dart';
import 'package:pegoda/controllers/customer_main.dart';
import 'package:pegoda/screens/welcome/register_screen.dart';
import 'package:pegoda/screens/welcome/sign_up_widget.dart';
import '../../MyLib/constants.dart' as Constants;

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool checkCurUser = false;

  @override
  Widget build(BuildContext context) => Material(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final user = FirebaseAuth.instance.currentUser!;
              String email = user.email!;
              checkCurExistedUser(email);
              if(checkCurUser){// true = old, false = new
                return CusMain(selectedIndex: 0, isBottomNav: true);
              }else{
                return RegisterScreen();
              }
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            } else {
              return SignUpWidget();
            }
          },
        ),
      );

  void checkCurExistedUser(String email) async {
    checkCurUser = false;
    checkCurUser = await LoginApi().checkCurUser(email);

  }
}
