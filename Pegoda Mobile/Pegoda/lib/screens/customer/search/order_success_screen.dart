import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../MyLib/constants.dart' as Constants;

class OrderSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _primaryColor = Constants.primaryColor;
    var _bgColor = Constants.bgColor;
    var _boxColor = Constants.boxColor;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: _boxColor,
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pop(context);
              Navigator.pushNamed(context, '/cusMain');
            },
            icon: ImageIcon(
              AssetImage('assets/cus/account_screen/cancel.png'),
              size: _pageHeight * 0.04,
              color: Color(0xFFBDBDBD),
            ),
          ),
        ],
      ),
      body: Material(
        child: Container(
          padding:
              EdgeInsets.fromLTRB(_pageWidth * 0.05, 0, _pageWidth * 0.05, 0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: _pageHeight * 0.1),
                Container(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/cus/search_screen/success_ic.png',
                    width: _pageWidth * 0.4,
                    height: _pageHeight * 0.3,
                  ),
                ),
                SizedBox(height: _pageHeight * 0.05),
                Text(
                  'Đặt Lịch Thành công',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: _pageHeight * 0.032,
                  ),
                ),
                SizedBox(height: _pageHeight * 0.05),
                Text(
                  'Lịch hẹn của bạn đã được đặt thành công. Đơn vị phụ trách sẽ xác nhận lịch hẹn và liên hệ với bạn sớm nhất.',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: _pageHeight * 0.023,
                  ),
                ),
                Text(
                  'Cám ơn bạn đã tin dùng Pegoda',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: _pageHeight * 0.023,
                  ),
                ),
                SizedBox(height: _pageHeight * 0.05),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(_primaryColor),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cusMain');
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: _pageWidth,
                    child: Text(
                      'Trờ về trang chủ'
                    ),
                  ),
                ),
                SizedBox(height: _pageHeight * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
