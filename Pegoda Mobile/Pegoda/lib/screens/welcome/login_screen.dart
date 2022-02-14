import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../MyLib/constants.dart' as Constants;

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final myController = TextEditingController();
  var choosen = "";
  bool _showPass = false;

  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _bgColor = Constants.bgColor;

    return Material(
      child: Container(
        width: _pageWidth,
        height: _pageHeight,
        color: _bgColor,
        padding:
            EdgeInsets.fromLTRB(_pageWidth * 0.15, 0, _pageWidth * 0.15, 0),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/Pegoda.png',
                  width: _pageWidth * 0.7,
                  height: _pageHeight * 0.3,
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                child: Text(
                  'Đăng nhập',
                  style: TextStyle(
                    fontSize: _pageHeight * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: _pageHeight * 0.025),
              Container(
                height: _pageHeight * 0.06,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Tài khoản',
                    hintStyle: TextStyle(
                      fontSize: _pageHeight * 0.02,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
              SizedBox(height: _pageHeight * 0.025),
              Container(
                height: _pageHeight * 0.06,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      width: _pageWidth * 0.5,
                      child: TextField(
                        obscureText: !_showPass,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Mật khẩu',
                          hintStyle: TextStyle(
                            fontSize: _pageHeight * 0.02,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        icon: !_showPass
                            ? ImageIcon(
                                AssetImage('assets/welcome/eye.png'),
                                color: Colors.black26,
                                size: _pageHeight * 0.05,
                              )
                            : ImageIcon(
                                AssetImage('assets/welcome/eye.png'),
                                color: Colors.blue,
                                size: _pageHeight * 0.05,
                              ),
                        onPressed: () {
                          showPass();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _pageHeight * 0.015),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/registerScreen');
                      },
                      child: Text(
                        'Đăng ký ngay',
                        style: TextStyle(
                          fontSize: _pageHeight * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/forgotPasswordScreen');
                      },
                      child: Text(
                        'Quên mật khẩu?',
                        style: TextStyle(
                          fontSize: _pageHeight * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                width: _pageWidth * 0.5,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    choosen = myController.text;
                    splitRole();
                  },
                  child: Text(
                    'Đăng nhập',
                    style: TextStyle(
                      fontSize: _pageHeight * 0.025,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(height: _pageHeight * 0.05),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Divider(
                          color: Colors.black87,
                          thickness: 1.5,
                        ),
                      ),
                    ),
                    Text(
                      "Hoặc đăng nhập bằng",
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: _pageHeight * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Divider(
                          color: Colors.black87,
                          thickness: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _pageHeight * 0.05),
              Container(
                width: _pageWidth * 0.7,
                height: _pageHeight * 0.06,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage('assets/welcome/fbicon.png'),
                        size: _pageHeight * 0.04,
                        color: Colors.white,
                      ),
                      Text(
                        ' Facebook',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _pageHeight * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                width: _pageWidth * 0.7,
                height: _pageHeight * 0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ImageIcon(
                      //   AssetImage(
                      //       'assets/welcome/ggicon2.png'),
                      //   size: _pageHeight * 0.04,
                      // ),
                      Image.asset('assets/welcome/ggicon2.png',
                          width: _pageHeight * 0.04),
                      Text(
                        '    Google',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: _pageHeight * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: _pageHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  void splitRole() async {
    setState(() {
      if (choosen == "1") {
        Navigator.pushNamed(context, '/pccMain');
      } else {
        Navigator.pushNamed(context, '/cusMain');
      }
    });
  }

  void showPass() async {
    setState(() {
      if (_showPass == true) {
        _showPass = false;
      } else {
        _showPass = true;
      }
    });
  }
}
