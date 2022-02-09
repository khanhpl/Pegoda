
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pegoda/screens/customer/up_nav_bar.dart';
import '../../MyLib/constants.dart' as Constants;

import 'package:carousel_pro/carousel_pro.dart';
class CusHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _bgColor = Constants.bgColor;
    return Scaffold(
      appBar: UpAppBar(context),
      body: Material(
        child: Container(
          padding: EdgeInsets.fromLTRB(_pageWidth*0.03, _pageHeight*0.03, _pageWidth*0.03, _pageHeight*0.1),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: _pageHeight * 0.2,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: CaroselImage,
                ),
                SizedBox(height: _pageHeight*0.03),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget CaroselImage = Center(
  child: Carousel(
    images: [
      AssetImage('assets/cus/main_screen/slide1.jpg'),
      AssetImage('assets/cus/main_screen/slide2.jpg'),
      AssetImage('assets/cus/main_screen/slide3.jpg'),
      AssetImage('assets/cus/main_screen/slide4.png'),
      AssetImage('assets/cus/main_screen/slide5.jpg'),
    ],
    autoplay: true,
    dotSize: 5,
    dotSpacing: 30,
    indicatorBgPadding: 0,
    autoplayDuration: Duration(seconds: 5),
    borderRadius: true,
    dotBgColor: Colors.black.withOpacity(0),
  ),
);
