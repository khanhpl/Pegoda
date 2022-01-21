
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}
class _LoginScreenState extends State<LoginScreen> {
  final myController = TextEditingController();
  var choosen = "";
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        width: _pageWidth,
        height: _pageHeight,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.yellow,
                width: _pageWidth*0.5,
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration.collapsed(

                    hintText: 'role',
                    hintStyle: TextStyle(
                      fontSize: _pageHeight * 0.02,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
              Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    choosen = myController.text;
                    print(choosen);
                    splitRole();
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: _pageHeight * 0.02,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
  void splitRole() async {
    setState(() {
      if(choosen == "1"){
        Navigator.pushNamed(context, '/pccMain');
      }else{
        Navigator.pushNamed(context, '/cusMain');
      }
    });
  }
}
