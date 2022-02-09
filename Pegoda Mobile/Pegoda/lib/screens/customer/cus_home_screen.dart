
import 'package:flutter/material.dart';
import 'package:pegoda/screens/customer/up_nav_bar.dart';
import '../../MyLib/constants.dart' as Constants;
class CusHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _bgColor = Constants.bgColor;
    return Scaffold(
      appBar: UpAppBar(context),
      body: Material(),
    );
  }
}
