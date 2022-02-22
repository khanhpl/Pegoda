import 'package:flutter/material.dart';
import '../../../MyLib/constants.dart' as Constants;

class PetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _bgColor = Constants.bgColor;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _bgColor,
        automaticallyImplyLeading: false,
        toolbarHeight: _pageHeight * 0.1,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: _pageWidth * 0.6,
              height: _pageHeight * 0.03,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/PegodaName.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        elevation: 0.0,
        backgroundColor: _bgColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        padding:
            EdgeInsets.only(left: _pageWidth * 0.03, right: _pageHeight * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: _pageHeight * 0.03),
              Text(
                'Thú cưng của bạn',
                style: TextStyle(
                  fontSize: _pageHeight*0.028,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
