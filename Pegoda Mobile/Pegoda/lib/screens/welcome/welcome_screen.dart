
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    return Material(
      child: Container(
        width: _pageWidth,
        height: _pageHeight,
        color: Color(0xFFBFEFFF),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/ic_pegoda.png',
                  width: _pageWidth * 0.7,
                  height: _pageHeight * 0.3,
                ),
              ),
              Container(
                child: Text('Bring the best services \nto your pet.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _pageHeight * 0.025,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: _pageHeight*0.05),
              Container(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/loginScreen');
                  },
                  child: Container(

                    child: Text(
                      'Next',
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
