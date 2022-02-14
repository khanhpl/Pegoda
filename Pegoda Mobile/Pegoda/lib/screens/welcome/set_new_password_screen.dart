
import 'package:flutter/material.dart';
import '../../MyLib/constants.dart' as Constants;

class SetNewPasswordScreen extends StatefulWidget {
  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {
  bool _showPass = false;
  bool _showRetypePass = false;
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _bgColor = Constants.bgColor;
    return Material(
      child: Container(
        padding:
        EdgeInsets.fromLTRB(_pageWidth * 0.15, 0, _pageWidth * 0.15, 0),
        color: _bgColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: _pageHeight * 0.05),
              Container(
                width: _pageWidth * 0.5,
                height: _pageHeight * 0.25,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/welcome/rspw.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                child: Text(
                  'Tạo mật khẩu mới.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _pageHeight * 0.025,
                    fontWeight: FontWeight.w400,

                  ),
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
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
                          hintText: 'Mật khẩu mới',
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
              SizedBox(height: _pageHeight * 0.03),
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
                        obscureText: !_showRetypePass,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Nhập lại mật khẩu',
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
              SizedBox(height: _pageHeight * 0.03),
              Container(
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
                    'Xác nhận',
                    style: TextStyle(
                      fontSize: _pageHeight * 0.025,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              SizedBox(height: _pageHeight * 0.03),
              Container(
                child: GestureDetector(
                  child: Text(
                    'Trở về trang chủ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: _pageHeight * 0.03,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  onTap: (){
                    Navigator.pushNamed(context, '/loginScreen');
                  },
                ),
              ),

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
