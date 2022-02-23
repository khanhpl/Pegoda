
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/provider/google_sign_in_provider.dart';
import 'package:provider/provider.dart';
import '../../MyLib/constants.dart' as Constants;

class SignUpWidget extends StatelessWidget {
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
                child: Text('Thú cưng là để thương yêu',
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
                width: _pageWidth * 0.8,
                height: _pageHeight * 0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/welcome/ggicon2.png',
                          width: _pageHeight * 0.04),
                      Text(
                        '    Tiếp tục với Google',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: _pageHeight * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
                    provider.googleLogin();
                  },
                ),
              ),
              SizedBox(height: _pageHeight*0.03),
              Container(
                width: _pageWidth * 0.8,
                height: _pageHeight * 0.06,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/welcome/fbicon.png',
                          width: _pageHeight * 0.04,
                        color: Colors.indigoAccent,
                      ),
                      Text(
                        '    Tiếp tục với Facebook',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: _pageHeight * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
