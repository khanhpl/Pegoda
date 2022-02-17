import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/account_choice.dart';
import '../../../MyLib/constants.dart' as Constants;
import '../../../MyLib/globals.dart' as globals;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
        padding:
            EdgeInsets.only(left: _pageWidth * 0.03, right: _pageHeight * 0.03),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: _pageHeight * 0.05),
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
                      ),
                    ),
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
                                image: AssetImage('assets/ic_pegoda.png'),
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
              SizedBox(height: _pageHeight * 0.03),
              Text(
                'Tài khoản',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: _pageHeight * 0.028,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: _pageHeight * 0.02),
              AccountChoice(
                  icon: Icons.account_box_rounded,
                  choiceTitle: 'Cài đặt tài khoản',
                  choiceLink: '/personalSettingScreen'),
              SizedBox(height: _pageHeight * 0.03),
              AccountChoice(
                  icon: Icons.pets,
                  choiceTitle: 'Thú cưng',
                  choiceLink: '/petScreen'),
              SizedBox(height: _pageHeight * 0.03),
              AccountChoice(
                  icon: Icons.history,
                  choiceTitle: 'Lịch sử đặt lịch',
                  choiceLink: '/orderHistoryScreen'),
              SizedBox(height: _pageHeight * 0.03),
              AccountChoice(
                  icon: Icons.settings_outlined,
                  choiceTitle: 'Cài đặt chung',
                  choiceLink: '/appSettingScreen'),
              SizedBox(height: _pageHeight * 0.05),
              Container(
                height: _pageHeight * 0.15,
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  // color: Color.fromRGBO(91, 150, 16, 1.0),
                  color: _bgColor,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: _pageHeight * 0.1,
                      width: _pageWidth * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/Pegoda.png'),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Đánh giá app Pegoda',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        RatingBar.builder(
                          itemSize: 20.0,
                          initialRating: 0,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(0xFFBDBDBD),
                            // size: 10.0,
                          ),
                          onRatingUpdate: (rating) {},
                        )
                      ],
                    ),
                    Spacer(),
                    Container(
                      height: _pageHeight * 0.05,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Đánh giá ngay',
                          style:
                              TextStyle(color: Colors.black45, fontSize: 10.0),
                          textAlign: TextAlign.center,
                        ),
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
