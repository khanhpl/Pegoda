import 'package:flutter/material.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../MyLib/globals.dart' as globals;

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
    return Material(
      child: Container(
        padding: EdgeInsets.only(left: _pageWidth*0.03, right: _pageHeight*0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: _pageHeight*0.05),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                            size: _pageHeight * 0.04,
                            color: Color(0xFFBDBDBD),
                          ),
                        )),
                    Spacer(),
                    Text(
                      'Chào, Khánh Phan',
                      textAlign: TextAlign.center,
                    ),
                    Spacer(),

                    globals.isAvatarChecked == false
                        ? Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image:
                          AssetImage('assets/ic_pegoda.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: _pageHeight * 0.07,
                      height: _pageHeight * 0.07,
                    )
                        : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(globals.avatarFile),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: _pageHeight * 0.07,
                      height: _pageHeight * 0.07,
                    ),

                  ],
                ),
              ),
              SizedBox(height: _pageHeight*0.03),
            ],
          ),
        ),
      ),
    );
  }
}
