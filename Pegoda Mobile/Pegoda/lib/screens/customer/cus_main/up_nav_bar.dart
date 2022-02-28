
import 'package:flutter/material.dart';
import '../../../MyLib/constants.dart' as Constants;

AppBar UpAppBar(context) {
  var _pageWidth = MediaQuery.of(context).size.width;
  var _pageHeight = MediaQuery.of(context).size.height;
  var _primaryColor = Constants.primaryColor;

  return AppBar(
    backgroundColor: _primaryColor,
    // automaticallyImplyLeading: false,
    toolbarHeight: _pageHeight * 0.08,
    leading: Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/app_ic.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Pegoda',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: _pageHeight*0.03,
            ),
          ),
        ),
      ],
    ),

    actions: [
      IconButton(
        onPressed: () {
          Navigator.pushNamed(context, '/searchScreen');
        },
        icon: Icon(
          Icons.search_sharp,
          color: Colors.white,
          size: _pageHeight * 0.05,
        ),
      ),
    ],
  );
}
