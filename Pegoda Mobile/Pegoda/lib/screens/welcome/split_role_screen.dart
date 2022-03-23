import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/repository/login_api.dart';
import 'package:pegoda/controllers/customer_main.dart';
import 'package:pegoda/screens/welcome/register_screen.dart';

class SplitRoleScreen extends StatefulWidget {
  User user;
  SplitRoleScreen({required this.user});
  @override
  State<SplitRoleScreen> createState() => _SplitRoleScreenState(user: this.user);
}

class _SplitRoleScreenState extends State<SplitRoleScreen> {
  User user;
  _SplitRoleScreenState({required this.user});
  String? jwtToken;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user.getIdToken().then((value) => {
      setState(() {
        jwtToken = value;
      })
    });
  }
  @override
  Widget build(BuildContext context) {
    Future<bool> loginFuture = LoginApi().checkCurUser(jwtToken!);
    return Material(
      child: FutureBuilder<bool>(
        future: loginFuture,
          builder: (context, snapshot){
            if (snapshot.hasError) print(snapshot.error);
            if (snapshot.hasData) {
            if(snapshot.data!){
                return CusMain(selectedIndex: 0, isBottomNav: true);
              }else{
                return RegisterScreen();
              }
            } else {
              return Container(child: CircularProgressIndicator());
            }
          },
          ),
    );
    // TODO: implement build
  }
}
