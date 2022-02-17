import 'package:flutter/material.dart';
import '../../../MyLib/constants.dart' as Constants;

AppBar UpAppBar(context) {
  var _pageWidth = MediaQuery.of(context).size.width;
  var _pageHeight = MediaQuery.of(context).size.height;
  var _bgColor = Constants.bgColor;

  return AppBar(
    backgroundColor: _bgColor,
    // automaticallyImplyLeading: false,
    toolbarHeight: _pageHeight * 0.1,
    leading: Container(
      height: _pageHeight * 0.03,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Pegoda.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          Container(
            width: _pageWidth*0.6,
            height: _pageHeight*0.03,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/PegodaName.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),

      ],
    ),

    actions: [
      IconButton(
        onPressed: (){
          Navigator.pushNamed(context, '/notificationScreen');
        },
        icon: Icon(Icons.notifications,color: Color(0xFF7289DA),),
      ),
    ],
  );
}
