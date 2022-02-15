import 'package:flutter/material.dart';
import '../../../MyLib/constants.dart' as Constants;

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _bgColor = Constants.bgColor;
    // TODO: implement build
    return Material(
      child: Container(
        padding:
            EdgeInsets.only(left: _pageWidth * 0.03, right: _pageHeight * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: _pageHeight * 0.05),
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: IconButton(
                        onPressed: () {
                          // Navigator.pop(context);
                          Navigator.pushNamed(context, '/cusMain');
                        },
                        icon: ImageIcon(
                          AssetImage('assets/cus/account_screen/cancel.png'),
                          size: _pageWidth * 0.1,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                    ),
                    SizedBox(width: _pageWidth * 0.2),
                    Text(
                      'Thông báo',
                      style: TextStyle(
                        fontSize: _pageHeight*0.04,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
