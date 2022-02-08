import 'package:flutter/material.dart';
import '../../MyLib/constants.dart' as Constants;

class ConfirmCodeScreen extends StatelessWidget {
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
                    image: AssetImage('assets/welcome/forgotpw.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: _pageHeight * 0.03),
              Container(
                child: Text(
                  'Nhập mã xác nhận.',
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
                  border: Border.all(color: Colors.black87, width: 2),
                ),
                child: TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'Mã xác nhận:',
                    hintStyle: TextStyle(
                      fontSize: _pageHeight * 0.02,
                      color: Colors.black26,
                    ),
                  ),
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
                    Navigator.pushNamed(context, '/setNewPasswordScreen');
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
            ],
          ),
        ),
      ),
    );
  }
}
