import 'package:flutter/material.dart';
import '../../MyLib/constants.dart' as Constants;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final myController = TextEditingController();
  var choosen = "";
  bool _showPass = false;
  bool _showRetypePass = false;

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
              Image.asset(
                'assets/Pegoda.png',
                width: _pageWidth * 0.7,
                height: _pageHeight * 0.3,
              ),
              SizedBox(
                height: _pageHeight * 0.03,
              ),
              Container(
                child: Text(
                  'Đăng ký',
                  style: TextStyle(
                    fontSize: _pageHeight * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: _pageHeight * 0.025,
              ),
              Container(
                height: _pageHeight * 0.06,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
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
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Điện thoại',
                    hintStyle: TextStyle(
                      fontSize: _pageHeight * 0.02,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _pageHeight * 0.025,
              ),
              Container(
                height: _pageHeight * 0.06,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      fontSize: _pageHeight * 0.02,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _pageHeight * 0.025,
              ),
              Container(
                height: _pageHeight * 0.06,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      width: _pageWidth * 0.5,
                      child: TextField(
                        controller: myController,
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
                      child: Container(
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
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _pageHeight * 0.025,
              ),
              Container(
                height: _pageHeight * 0.06,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      width: _pageWidth * 0.5,
                      child: TextField(
                        obscureText: !_showRetypePass,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Xác nhận Mật khẩu ',
                          hintStyle: TextStyle(
                            fontSize: _pageHeight * 0.02,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: IconButton(
                          icon: !_showRetypePass
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
                            showRetypePass();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: _pageHeight * 0.03,
              ),
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
                    Navigator.pushNamed(context, '/loginScreen');
                  },
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(
                      fontSize: _pageHeight * 0.025,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _pageHeight * 0.015,
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                      'Đã có mật khẩu?',
                      style: TextStyle(
                        fontSize: _pageHeight * 0.02,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/loginScreen');
                      },
                      child: Text(
                        'Đăng nhập',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: _pageHeight * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: _pageHeight * 0.3),
            ],
          ),
        ),
      ),
    );
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

  void showRetypePass() async {
    setState(() {
      if (_showRetypePass == true) {
        _showRetypePass = false;
      } else {
        _showRetypePass = true;
      }
    });
  }
}
