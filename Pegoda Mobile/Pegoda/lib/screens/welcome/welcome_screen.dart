
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pegoda/controllers/customer_main.dart';
import 'package:pegoda/screens/welcome/sign_up_widget.dart';
import '../../MyLib/constants.dart' as Constants;

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Material(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),

          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              final user = FirebaseAuth.instance.currentUser!;
              String s = user.uid;
              print("uid: " + s);
              return CusMain(selectedIndex: 0, isBottomNav: true);
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            } else {
              // final user = FirebaseAuth.instance.currentUser!;
              // print("ten nguoi dung" + user.displayName!);
              return SignUpWidget();
            }
          },
        ),
      );
}
