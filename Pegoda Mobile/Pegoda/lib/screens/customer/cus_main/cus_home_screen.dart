
import 'package:flutter/material.dart';
import 'package:pegoda/MyLib/class/coupon.dart';
import 'package:pegoda/screens/customer/cus_main/show_coupon_on_home_screen.dart';
import 'package:pegoda/screens/customer/cus_main/up_nav_bar.dart';
import '../../../MyLib/constants.dart' as Constants;
import 'package:carousel_pro/carousel_pro.dart';

class CusHomeScreen extends StatefulWidget {
  @override
  State<CusHomeScreen> createState() => _CusHomeScreenState();
}

class _CusHomeScreenState extends State<CusHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var _pageHeight = MediaQuery.of(context).size.height;
    var _pageWidth = MediaQuery.of(context).size.width;
    var _bgColor = Constants.bgColor;
    List<Coupon> _couponList = [
      Coupon(
          couponImage: 'assets/cus/main_screen/coupon1.png',
          couponContent: 'Bí kíp chăm sóc thú cưng mùa dịch cùng pet box.'),
      Coupon(
          couponImage: 'assets/cus/main_screen/coupon2.jpg',
          couponContent: 'Grooming spa ưu đãi lên đến 45%'),
      Coupon(
          couponImage: 'assets/cus/main_screen/coupon3.jpg',
          couponContent: 'Ú tim tìm boss ưu đã lên đến 50%'),
      Coupon(
          couponImage: 'assets/cus/main_screen/coupon4.jpg',
          couponContent: 'Sen ơi ở đây có giảm giá nhà gỗ lofe pet nè'),
      Coupon(
          couponImage: 'assets/cus/main_screen/coupon5.jpg',
          couponContent: 'Trải nghiệm siêu tiết kiệm'),
      Coupon(
          couponImage: 'assets/cus/main_screen/coupon6.jpg',
          couponContent: 'Sale tết lên đến 50%'),
    ];
    return Scaffold(
      appBar: UpAppBar(context),
      body: Material(
        child: Container(
          padding: EdgeInsets.fromLTRB(_pageWidth * 0.03, 0,
              _pageWidth * 0.03, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            // physics: ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _pageHeight*0.03),
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
                      //Tìm kiếm
                      Column(
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/searchScreen');
                              },
                              child: Icon(
                                Icons.search,
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
                              'Tìm kiếm\ndịch vụ',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),

                      //Trung tâm nổi bật
                      SizedBox(width: _pageWidth * 0.03),
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
                              'Trung tâm \ngần nhất',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: _pageWidth * 0.03),
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
                              'Dịch vụ \ngần nhất',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: _pageWidth * 0.03),
                      //Câu hỏi thường gặp
                      Column(
                        children: [
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/questionScreen');
                              },
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
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: _pageWidth * 0.03),
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
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                //khuyến mãi
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
                Container(
                  height: _pageHeight*0.22,
                  child: ListView.separated(
                    // physics: NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: _couponList.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: _pageWidth * 0.03);
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return ShowCouponOnHomeScreen(coupon: _couponList[index]);
                    },
                  ),
                ),

                SizedBox(height: _pageHeight * 0.1),
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
