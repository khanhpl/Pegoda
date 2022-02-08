
import 'package:flutter/material.dart';
import '../../MyLib/constants.dart' as Constants;

class WelcomeScreen extends StatelessWidget {
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
              Container(
                child: Text('Mang những dịch vụ tốt nhất\n Đến với thú cưng của bạn.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _pageHeight * 0.025,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: _pageHeight*0.05),
              Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF7289DA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginScreen');
                  },
                  child: Container(

                    child: Text(
                      'Tiếp Theo',
                      style: TextStyle(
                        fontSize: _pageHeight * 0.025,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
