
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
          padding: EdgeInsets.fromLTRB(_pageWidth * 0.03, _pageHeight * 0.03,
              _pageWidth * 0.03, _pageHeight * 0.1),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //slide
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

                //danh mục
                SizedBox(height: _pageHeight * 0.03),
                Container(
                  child: Text(
                    'Danh mục',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: _pageHeight * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: _pageHeight * 0.02),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      //Trung tâm nổi bật
                      Column(
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.home,
                                size: _pageWidth * 0.3 * 0.33,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(5),
                                primary: _bgColor,
                              ),
                            ),
                          ),
                          SizedBox(height: _pageHeight * 0.03),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Trung tâm \nnổi bật',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: _pageWidth*0.03),
                      //Dịch vụ nổi bật
                      Column(
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.home_repair_service,
                                size: _pageWidth * 0.3 * 0.33,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(5),
                                primary: _bgColor,
                              ),
                            ),
                          ),
                          SizedBox(height: _pageHeight * 0.03),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Dịch vụ \nnổi bật',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: _pageWidth*0.03),
                      //Câu hỏi thường gặp
                      Column(
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.question_answer,
                                size: _pageWidth * 0.3 * 0.33,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(5),
                                primary: _bgColor,
                              ),
                            ),
                          ),
                          SizedBox(height: _pageHeight * 0.03),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Câu hỏi \nthường gặp',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: _pageWidth*0.03),
                      //Tư vấn trực tuyến
                      Column(
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.contact_phone,
                                size: _pageWidth * 0.3 * 0.33,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(5),
                                primary: _bgColor,
                              ),
                            ),
                          ),
                          SizedBox(height: _pageHeight * 0.03),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Tư vấn \ntrực tuyến',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: _pageWidth*0.03),
                      //Thư viện bệnh lý
                      Column(
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.book,
                                size: _pageWidth * 0.3 * 0.33,
                                color: Colors.white,
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(5),
                                primary: _bgColor,
                              ),
                            ),
                          ),
                          SizedBox(height: _pageHeight * 0.03),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Thư viện \nbệnh lý',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: _pageHeight * 0.03),
                Container(
                  child: Text(
                    'Khuyến mãi nổi bật',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: _pageHeight * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: _pageHeight * 0.02),
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
