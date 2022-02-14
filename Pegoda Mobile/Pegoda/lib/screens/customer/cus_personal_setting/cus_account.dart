import 'package:flutter/material.dart';
import '../../../MyLib/constants.dart' as Constants;

class CusAccountScreen extends StatefulWidget {
  @override
  State<CusAccountScreen> createState() => _CusAccountScreenState();
}

class _CusAccountScreenState extends State<CusAccountScreen> {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _bgColor = Constants.bgColor;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _bgColor,
        leading: Icon(Icons.close),
        title: Container(
          width: _pageWidth*0.6,
          height: _pageHeight*0.03,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/PegodaName.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Tài khoản',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
