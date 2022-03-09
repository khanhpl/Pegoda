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
  String token="";
  // final Stream<dynamic> _stream = (() async* {
  //   FirebaseAuth.instance.authStateChanges();
  //   final user = FirebaseAuth.instance.currentUser!;
  // })();

  @override
  Widget build(BuildContext context) => Material(

        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return RegisterScreen();
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            } else {
              return SignUpWidget();
            }
          },
        ),
      );

}
